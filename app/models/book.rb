class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :reviews
  validates :title, :summary, :publish_year, presence: true
  accepts_nested_attributes_for :genre, reject_if: :all_blank
  accepts_nested_attributes_for :author, reject_if: :all_blank
  has_one_attached :cover
end
