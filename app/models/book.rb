class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :reviews
  validates :title, :summary, :publish_date, :author, :genre, presence: true 
end
