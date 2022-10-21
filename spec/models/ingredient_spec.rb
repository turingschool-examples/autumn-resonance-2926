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
    it "#sort_alphabetically sorts ingredients alphabetically" do
      sauce = Ingredient.create!(name:'Sauce', cost:5)
      peppperoni = Ingredient.create!(name:'Peppperoni', cost:8)
      dough = Ingredient.create!(name:'Dough', cost:2)
      
      expect(Ingredient.sort_alphabetically).to eq([dough, peppperoni, sauce])
    end
  end
end
