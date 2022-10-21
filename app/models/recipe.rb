class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
  validates :complexity, presence: true
  validates :genre, presence: true

  def total_cost
    self.ingredients.sum {|ing| ing.cost}
  end
end