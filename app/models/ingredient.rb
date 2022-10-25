class Ingredient < ApplicationRecord

  validates :name, presence: true
  validates :cost, presence: true
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients


  def self.alphabetically_by_name
    all.order(:name)
  end
end