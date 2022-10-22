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

  describe '#total_cost' do
    before(:each) do
      @carrots = Ingredient.create!(name: "Carrots", cost: 2)
      @onions = Ingredient.create!(name: "Onions", cost: 3)
      @cellery = Ingredient.create!(name: "Cellery", cost: 3)
      @stock = Recipe.create!(name: "Stock", complexity: 2, genre: "basic")
      RecipeIngredient.create!(recipe: @stock, ingredient: @carrots)
      RecipeIngredient.create!(recipe: @stock, ingredient: @onions)
      RecipeIngredient.create!(recipe: @stock, ingredient: @cellery)
    end
    it 'will get the sum cost of all ingredients in a recipe' do
      number = (@carrots.cost + @onions.cost + @cellery.cost)
      expect(@stock.total_cost).to eq(number)
    end
  end
end
