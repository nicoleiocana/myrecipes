class Ingredient < ApplicationRecord
  before_save :name_capitalize
  
  validates :name, presence: true, length: { minimum: 3, maximum: 25 },
                               uniqueness: true
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  
  private
  
    def name_capitalize
      self.name = name.capitalize
    end
  
end