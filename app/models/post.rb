class Post < ApplicationRecord
  belongs_to :author, optional: false
  has_many :comments
  validates :title, presence: true
  validates :content, presence: true
  validates :author_id, presence: true
end
