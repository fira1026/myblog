class Comment < ApplicationRecord
	belongs_to :post, optional: false
	validates :body, presence: true
end
