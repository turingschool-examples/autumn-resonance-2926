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

  describe "Instance methods" do 
    it "#total_cost" do 
       ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2)
     ingredient2 = Ingredient.create!(name: "Salt", cost: 4)

     recipe = Recipe.create!(name: "Beef and Salt", complexity: 0, genre: "American")
     
     recipe.ingredients << ingredient1 
     recipe.ingredients << ingredient2 
     
     expect(recipe.total_cost).to eq(6)

    end
  end
end
