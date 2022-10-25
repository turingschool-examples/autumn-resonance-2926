class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true
  validates :cost, presence: true

  def self.total_cost
    Ingredient.sum(:cost)
  end
end
