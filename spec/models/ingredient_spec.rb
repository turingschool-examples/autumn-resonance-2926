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

  describe 'instance methods' do
    describe '#order_by_name' do
      ing1 = Ingredient.create!(name: 'Apple', cost: 2)
      ing2 = Ingredient.create!(name: 'Watermelon', cost: 1)
      ing3 = Ingredient.create!(name: 'Candy', cost: 3)
      ingredients = Ingredient.all
      it 'orders ingredients by name' do
        expect(ingredients.order_by_name).to eq([ing1, ing3, ing2])
      end
    end
  end

end
