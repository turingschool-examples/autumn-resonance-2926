class Recipe < ApplicationRecord
  validates_presence_of :complexity 
  validates_presence_of :genre 
  validates_presence_of :name 

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def ingredients_total
    total = 0
    ingredients.map do |ingredient|
      total += ingredient.cost
    end
    total
  end
end