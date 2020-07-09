class Genre < ApplicationRecord
  has_many :books
  has_many :authors, through: :books
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
