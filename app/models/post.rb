class Post < ApplicationRecord
  belongs_to :user, optional: false
  has_many :comments, dependent: :destroy_async
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
end
