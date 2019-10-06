class Recipe < ApplicationRecord
  validates :name, :description, :chef_id, presence: true
  validates :description, length: { minimum: 5, maximum: 500 }
  belongs_to :chef
end