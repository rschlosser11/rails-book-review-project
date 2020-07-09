class User < ApplicationRecord
  has_many :books, through: :reviews
  has_many :comments
  has_many :reviews, through: :comments
  has_secure_password
  validates :password, :name, presence: true
  validates :email, format: { with: /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b/ }, uniqueness: { case_sensitive: false }, presence: true
  validates :password, length: { minimum: 6 }
  validates :name, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
  validates :reviewer, inclusion: { in: [true, false] }
  validates :bio, presence: true, if: :is_reviewer?

  def reviews_written
    Review.where(user: self)
  end

  def is_reviewer?
    self.reviewer == true
  end
end
