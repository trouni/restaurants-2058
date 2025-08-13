class Review < ApplicationRecord
  # associations
  belongs_to :restaurant # creates a method review.restaurant
  # validations
  validates :content, presence: true
end
