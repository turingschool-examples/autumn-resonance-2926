require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe '#order_name' do
    before(:each) do
      @carrots = Ingredient.create!(name: "Carrots", cost: 2)
      @onions = Ingredient.create!(name: "Onions", cost: 3)
      @cellery = Ingredient.create!(name: "Cellery", cost: 3)
      @stock = Recipe.create!(name: "Stock", complexity: 2, genre: "basic")
      RecipeIngredient.create!(recipe: @stock, ingredient: @carrots)
      RecipeIngredient.create!(recipe: @stock, ingredient: @onions)
      RecipeIngredient.create!(recipe: @stock, ingredient: @cellery)
    end

    it 'order ingredients alphabeticaly' do
      ordered = Ingredient.all.order_name.to_a

      expect(ordered).to eq([@carrots, @cellery, @onions])
    end
  end
end
