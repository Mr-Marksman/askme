class User < ApplicationRecord
  has_secure_password

  validates :email, 
    presence: true, 
    uniqueness: true, 
    format: { 
      with: /\A^[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+$\z/i, 
      message: ": Please, put Email in right format: example.email@example.com" 
    }

  validates :nickname, 
    presence: true,
    uniqueness: true,
    length: { maximum: 40, message: ": length must be less than 40 symbols" },
    format: { 
      with: /\A[[:alnum:]_]+\z/i, 
      message: ': Put only latin letters, numbers and "_"' 
    }

  validates :name, presence: true

  before_save :downcase_nickname

  def downcase_nickname
    nickname.downcase!
  end
end
