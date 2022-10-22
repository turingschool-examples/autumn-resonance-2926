require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe "Instance Methods" do
    it "#total_cost" do
      omelette = Recipe.create!(name: "Omelette", complexity: 1, genre: "Breakfast")
      eggs = Ingredient.create!(name: "Eggs", cost: 1)
      cheese = Ingredient.create!(name: "Cheese", cost: 2)
      mushrooms = Ingredient.create!(name: "Mushrooms", cost: 2)
      steak = Ingredient.create!(name: "Steak", cost: 5)

      RecipeIngredient.create!(ingredient: eggs, recipe: omelette)
      RecipeIngredient.create!(ingredient: cheese, recipe: omelette)
      RecipeIngredient.create!(ingredient: mushrooms, recipe: omelette)
      RecipeIngredient.create!(ingredient: steak, recipe: omelette)

      expect(omelette.total_cost).to eq(10)
    end
  end
end
