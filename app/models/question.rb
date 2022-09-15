class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: "User", optional: true
  has_many :question_hashtags, dependent: :delete_all
  has_many :hashtags, through: :question_hashtags
  
  validates :body,
    presence: true, length: { maximum: 500 }

  validates :topic,
    presence: true, length: { maximum: 100 }

  after_commit :create_hashtags_if_needed, on: [:create, :update]
  after_commit :destroy_hashtags_if_needed, on: [:destroy]

  def create_hashtags_if_needed
    all_question_hashtags = "#{body} #{answer} #{topic}".scan(/#[[:word:]-]+/).uniq

    all_question_hashtags.each do |hashtag_body|
      new_question_hashtag = self.question_hashtags.build(body: hashtag_body.downcase.delete("#"))
      new_question_hashtag.hashtag = Hashtag.find_or_create_by(body: hashtag_body.downcase.delete("#"))
      new_question_hashtag.save
    end
  end

  def destroy_hashtags_if_needed
    Hashtag.where_not_exists(:questions).destroy_all
  end
end
