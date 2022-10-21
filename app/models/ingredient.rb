class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :cost, presence: true, numericality: true 
  
  belongs_to :recipe, optional: true
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end