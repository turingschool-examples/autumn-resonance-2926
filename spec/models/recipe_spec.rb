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

  describe 'instance method' do
    describe '#total_cost'do
      dish = Recipe.create!(name: 'nachos', complexity: 10, genre: 'good')
      dish.ingredients.create!(name: 'chips', cost: 5)
      dish.ingredients.create!(name: 'cheese', cost: 20)
      it'calculates total cost of the ingredients' do
        expect(dish.total_cost).to eq(25)
      end
    end
  end
end
