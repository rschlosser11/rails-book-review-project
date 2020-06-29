class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  validates :content, :user, :review, presence: true
end
