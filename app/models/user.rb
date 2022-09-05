class User < ApplicationRecord
  has_secure_password

  has_many :questions, dependent: :delete_all

  validates :email, 
    presence: true, 
    uniqueness: true, 
    format: { 
      with: /\A^[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+$\z/i, 
    }

  validates :nickname, 
    presence: true,
    uniqueness: true,
    length: { maximum: 20},
    format: { 
      with: /\A\w+\z/, 
    }

  validates :name, presence: true

  validates :color, 
    presence: true,
    format: { with: /\A#([[:xdigit:]]{6}|[[:xdigit:]]{3})\z/i, }

  before_validation :downcase_nickname

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
