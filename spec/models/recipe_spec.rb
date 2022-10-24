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

  describe 'Active Record tests' do 
    before :each do 

    @recipe1= Recipe.create!(name: "Gorden Ramsey's 5 Star Fish", complexity: 9, genre: "Seafood")
    @recipe2= Recipe.create!(name: "Exclusive Dessert", complexity: 5, genre: "Dessert")
    @ingr1 = @recipe2.ingredients.create!(name: "Expired Milk", cost: 10)
    @ingr2 = @recipe2.ingredients.create!(name: "Moldy Fruit", cost: 5)
    @ingr3 = @recipe1.ingredients.create!(name: "Rancid Fish", cost: 20)
    @ingr4 = @recipe1.ingredients.create!(name: "Bar Matt Tequila", cost: 100)
    
  end
    xit 'Adds up total cost of all the ingredients in a recipe' do 

      expect(@recipe1.total_cost).eq(120)
    end
  end
end
