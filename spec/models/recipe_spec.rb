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
    it "returns the total cost of all ingredients in a recipe" do
      pizza = Recipe.create!(name:'Pizza', complexity:4, genre:'Italian')
      sauce = Ingredient.create!(name:'Sauce', cost:5)
      peppperoni = Ingredient.create!(name:'Peppperoni', cost:8)
      dough = Ingredient.create!(name:'Dough', cost:2)
      
      pizza.ingredients << sauce
      pizza.ingredients << peppperoni
      pizza.ingredients << dough
      
      expect(pizza.total_cost).to eq(15)
    end
  end
end
