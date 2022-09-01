class Question < ApplicationRecord
  
  belongs_to :user

  belongs_to :author, class_name: "User", optional: true
  
  validates :body, 
    presence: true, length: { maximum: 500 }

  validates :topic, 
    presence: true, length: { maximum: 100 }
end
