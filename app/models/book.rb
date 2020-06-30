class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :reviews
  validates :title, :summary, :publish_date, :author, :genre, presence: true
  accepts_nested_attributes_for :genre
  accepts_nested_attributes_for :author
end
