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

  describe 'Active record method for total cost' do 

    before :each do 

      @recipe1= Recipe.create!(name: "Gorden Ramsey's 5 Star Fish", complexity: 9, genre: "Seafood")
      @ingr3 = @recipe1.ingredients.create!(name: "Rancid Fish", cost: 20)
      @ingr4 = @recipe1.ingredients.create!(name: "Bar Matt Tequila", cost: 100)
    end
    it 'Adds up total cost of all the ingredients in a recipe' do 

      expect(Ingredient.total_cost).to eq(120)
    end
  end
end
