class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :complexity, presence: true
  validates :genre, presence: true

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def total_cost
    self.ingredients.sum do |ingredient|
      ingredient.cost
    end
  end
end