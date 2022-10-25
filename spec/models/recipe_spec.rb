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

  describe 'instance methods' do
    describe ".needed_ingredients" do
      it 'returns the names of ingredients needed by the recipe' do
        recipe = Recipe.create!(name: "Steak Stew", complexity: 2, genre: "American")
        ingredient_1 = recipe.ingredients.create!(name: 'Steak', cost: 10)
        ingredient_2 = recipe.ingredients.create!(name: 'Tomato', cost: 3)
        ingredient_3 = recipe.ingredients.create!(name: 'Carrot', cost: 2)
    
        expect(recipe.needed_ingredients).to eq(['Steak', 'Tomato', 'Carrot'])
      end
    end

    describe ".ingredients_cost" do
      it 'returns the names of ingredients needed by the recipe' do
        recipe = Recipe.create!(name: "Steak Stew", complexity: 2, genre: "American")
        ingredient_1 = recipe.ingredients.create!(name: 'Steak', cost: 10)
        ingredient_2 = recipe.ingredients.create!(name: 'Tomato', cost: 3)
        ingredient_3 = recipe.ingredients.create!(name: 'Carrot', cost: 2)
    
        expect(recipe.ingredients_cost).to eq(ingredient_1.cost + ingredient_2.cost + ingredient_3.cost)
      end
    end
  end
end
