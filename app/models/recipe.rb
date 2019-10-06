class Recipe < ApplicationRecord
  validates :name, :description, presence: true
  validates :description, length: { minimum: 5, maximum: 500 }
end