class Question < ApplicationRecord
  
  belongs_to :user
  
  validates :body, 
    presence: true, length: { maximum: 500 }

  validates :topic, 
    presence: true, length: { maximum: 100 }
end
