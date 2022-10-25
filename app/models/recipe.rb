class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, :complexity, :genre, presence: true

  def total_ingredient_cost
    # require "pry"; binding.pry
    self.ingredients.sum(:cost)
  end
end
