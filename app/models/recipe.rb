class Recipe < ApplicationRecord
  validates_presence_of :name, :complexity, :genre

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def self.total_cost(ingredients)
    ingredients.sum do |ingredient|
      ingredient.cost
    end
  end
end