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

  describe 'class methods' do
    describe '#order_alphabetically' do
      it 'should sort the ingredients alphabetically by name' do
        ingredient_1 = Ingredient.create!(name: 'Steak', cost: 10)
        ingredient_2 = Ingredient.create!(name: 'Tomato', cost: 3)
        ingredient_3 = Ingredient.create!(name: 'Carrot', cost: 2)

        expect(Ingredient.order_alphabetically).to eq([ingredient_3, ingredient_1, ingredient_2])
      end
    end
  end
end
