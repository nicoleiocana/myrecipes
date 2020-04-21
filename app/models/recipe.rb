class Recipe < ApplicationRecord
  before_save :name_format, :description_format
  
  validates :name, :description, :chef_id, presence: true
  validates :description, length: { minimum: 5, maximum: 500 }
  belongs_to :chef
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  default_scope -> {order(updated_at: :desc)}
  
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end
  
  private
  
    def name_format
      self.name = name.split.map(&:capitalize)*' '
    end
    
    def description_format
      self.description = description.capitalize
    end
end