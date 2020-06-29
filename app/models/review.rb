class Review < ApplicationRecord
  belongs_to :book
  has_many :comments
  has_many :users, through: :comments
  belongs_to :user, -> { where(admin: true) }
  validates :title, :content, :blurb, :book, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :blurb, presence: true, length: { maximum: 280 }
  validates :book, uniqueness: { scope: :user, message: "already wrote a review for this book"}

end
