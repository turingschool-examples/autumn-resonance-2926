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

  describe 'model methods' do
    it 'can add up the cost of all ingredients in a recipe' do
      chicken = Ingredient.create!(name: 'Chicken Thighs', cost: '4')
      salt = Ingredient.create!(name: 'Salt', cost: '2')

      vin = Recipe.create!(name: 'Coq Au Vin', complexity: 5, genre: 'French')

      recipe_ingredient1 = RecipeIngredient.create(ingredient_id: salt.id, recipe_id: vin.id)
      recipe_ingredient2 = RecipeIngredient.create(ingredient_id: chicken.id, recipe_id: vin.id)

      expect(vin.total_cost).to eq(6)
    end
  end
end
