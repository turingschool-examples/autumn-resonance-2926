require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many(:ingredients).through(:recipe_ingredients)}
    it {should have_many :recipe_ingredients}
  end

  describe '#total_cost' do
    it 'calculates the total cost for a recipe' do
      recipe_1 = Recipe.create!(name: 'pasta', complexity: 3, genre: 'Italian')
      ingredient_1 = recipe_1.ingredients.create!(name: 'flour', cost: 1)
      ingredient_2 = recipe_1.ingredients.create!(name: 'water', cost: 2)
      ingredient_3 = recipe_1.ingredients.create!(name: 'salt', cost: 3)

      expect(recipe_1.total_cost).to eq(6)
    end
  end
end
