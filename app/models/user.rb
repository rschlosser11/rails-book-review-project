class User < ApplicationRecord
  has_many :books, through: :reviews
  has_many :comments
  has_many :reviews, through: :comments
  has_secure_password

  def reviews_written
    Review.where(user: self)
  end
end
