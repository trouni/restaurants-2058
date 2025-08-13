class Restaurant < ApplicationRecord
  # associations
  # dependent: :destroy -> destroy other instances that are dependent on it
  has_many :reviews, dependent: :destroy # creates a method restaurant.reviews
  # validations
  # validates :column_name, whatever_validation
  validates :name, presence: true
end
