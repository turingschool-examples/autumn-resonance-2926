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

  describe 'class methods' do
    describe '#total_cost' do
      it 'determines the sum of the ingredient costs for a recipe' do
        recipe_1 = Recipe.create(name: 'Spaghetti', complexity: 5, genre: 'Italian')
        meatballs = Ingredient.create!(name: 'meatballs', cost: 14)
        spaghetti = Ingredient.create!(name: 'pasta', cost: 2)
        sauce = Ingredient.create!(name: 'sauce', cost: 7)
        recipe_ingredients_1 = RecipeIngredient.create!(recipe: recipe_1, ingredient: meatballs)
        recipe_ingredients_2 = RecipeIngredient.create!(recipe: recipe_1, ingredient: spaghetti)
        recipe_ingredients_3 = RecipeIngredient.create!(recipe: recipe_1, ingredient: sauce)
        ingredients = [meatballs, spaghetti, sauce]

        expect(Recipe.total_cost(ingredients)).to eq(23)
      end
    end
  end
end
