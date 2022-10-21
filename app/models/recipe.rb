class Recipe < ApplicationRecord
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients

  validates :name, presence: true
  validates :complexity, presence: true
  validates :genre, presence: true
end