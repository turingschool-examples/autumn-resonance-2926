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

  describe '#alphabetical' do 
    it 'ingredient name is sorted alphabetically' do 
      cheese = Ingredient.create!(name: "Cheese", cost: 3)
      salami = Ingredient.create!(name: "Salami", cost: 5)
      olives = Ingredient.create!(name: "Black Olives", cost: 2)
      onions = Ingredient.create!(name: "Onions", cost: 1)

      expect(Ingredient.alphabetical).to eq([olives, cheese, onions, salami ])
    end
  end
end
