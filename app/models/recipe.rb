class Recipe < ApplicationRecord
  before_save :name_format, :description_format
  
  validates :name, :description, :chef_id, presence: true
  validates :description, length: { minimum: 5, maximum: 500 }
  belongs_to :chef
  
  private
  
    def name_format
      self.name = name.split.map(&:capitalize)*' '
    end
    
    def description_format
      self.description = description.capitalize
    end
end