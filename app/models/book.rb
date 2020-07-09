class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :reviews
  has_one_attached :cover
  validates :title, :summary, :publish_year, :cover, presence: true
  validates :title, uniqueness: { scope: :author, case_sensitive: false, message: "already exists for this author" }
  accepts_nested_attributes_for :genre, reject_if: :all_blank
  accepts_nested_attributes_for :author, reject_if: :all_blank


  def self.title_start_with(letter)
      where("title LIKE ?", "#{letter}%")
  end

  def same_author
    Book.find_by(title: self.title)
  end
end
