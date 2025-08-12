class Restaurant < ApplicationRecord
  # associations
  # validations
  # validates :column_name, whatever_validation
  validates :name, presence: true
end
