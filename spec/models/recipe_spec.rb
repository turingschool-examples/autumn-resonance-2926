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
    describe '#total_ingredient_cost' do
      it 'can return the total cost of all of the recipe\'s ingredients' do
        pasta = Recipe.create(name: "Pasta", complexity: 2, genre: "Italian")
        salt = Ingredient.create(name: "Salt", cost: 4)
        flour = Ingredient.create(name: "Flour", cost: 3)

        RecipeIngredient.create!(ingredient: salt, recipe: pasta)
        RecipeIngredient.create!(ingredient: flour, recipe: pasta)

        expect(pasta.total_ingredient_cost).to eq(7)

      end
    end
  end
end
