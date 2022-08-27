class User < ApplicationRecord
  has_secure_password

  validates :email, 
    presence: true, 
    uniqueness: true, 
    format: { 
      with: /\A^[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+$\z/i, 
    }

  validates :nickname, 
    presence: true,
    uniqueness: true,
    length: { maximum: 40, message: ": length must be less than 40 symbols" },
    format: { 
      with: /\A[[a-z0-9]_]+\z/i, 
    }

  validates :name, presence: true

  before_validation :downcase_nickname

  def downcase_nickname
    nickname.downcase!
  end
end
