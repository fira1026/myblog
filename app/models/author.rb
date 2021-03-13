VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

class Author < ApplicationRecord
  has_many :posts

  has_secure_password

  validates :name, presence: true, 
    uniqueness: { case_sensitive: false }, 
    length: { minimum: 3, maximum: 25 }

  validates :email, presence: true, 
    length: { maximum: 105 },
    uniqueness: { case_sensitive: false }, 
    format: { with: VALID_EMAIL_REGEX }
    before_save { self.email = email.downcase }
    
end