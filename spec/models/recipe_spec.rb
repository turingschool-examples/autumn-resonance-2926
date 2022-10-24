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
    describe '#total_cost' do 
      it 'returns the total cost of all ingredients in a recipe' do 
        cheese = Ingredient.create!(name: "Pecorino Cheese", cost: 1)
        pasta = Ingredient.create!(name: "Penne Pasta", cost: 2)
        tomatoes = Ingredient.create!(name: "Tomatoes", cost: 3)
        pasta_recipe = Recipe.create!(name: "Pasta Marinara", complexity: 1, genre: "Italian")

        RecipeIngredient.create!(recipe: pasta_recipe, ingredient: cheese)
        RecipeIngredient.create!(recipe: pasta_recipe, ingredient: pasta)
        RecipeIngredient.create!(recipe: pasta_recipe, ingredient: tomatoes)

        expect(pasta_recipe.total_cost).to eq(6)

        mushrooms = Ingredient.create!(name: "Mushrooms", cost: 4)
        RecipeIngredient.create!(recipe: pasta_recipe, ingredient: mushrooms)

        expect(pasta_recipe.total_cost).to eq(10)
      end
    end
  end
end
