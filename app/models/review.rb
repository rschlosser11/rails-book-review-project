class Review < ApplicationRecord
  belongs_to :book
  has_many :comments
  has_many :users, through: :comments
  belongs_to :user, -> { where(admin: true) }
end
