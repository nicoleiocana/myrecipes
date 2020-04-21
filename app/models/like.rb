class Like < ApplicationRecord
  belongs_to :chef
  belongs_to :recipe
  
  validates :chef, uniqueness: { scope: :recipe }
end