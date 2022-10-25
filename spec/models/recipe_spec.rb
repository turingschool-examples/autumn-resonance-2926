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

  describe '#total_cost' do 
    it 'can calculate total cost of recipe ingredients' do 
      pizza = Recipe.create!(name: "Pizza", complexity: 4, genre: "Italian")
      cheese = pizza.ingredients.create(name: "Cheese", cost: 3)
      salami = pizza.ingredients.create(name: "Salami", cost: 5)
      
      expect(pizza.total_cost).to eq(8)
    end
  end
end
