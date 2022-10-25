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

  before:each do
    @recipe1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
    @recipe2 = Recipe.create!(name: "Shepherd's Pie", complexity: 3, genre: "Irish")
    @ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient2 = Ingredient.create!(name: "Salt", cost: 4)    
    @ingredient3 = Ingredient.create!(name: "Onion", cost: 1)    
    @ingredient4 = Ingredient.create!(name: "Tomato", cost: 3) 
    @recip_ing1 = RecipeIngredient.create!(recipe: @recipe1, ingredient: @ingredient1)
    @recip_ing2 = RecipeIngredient.create!(recipe: @recipe1, ingredient: @ingredient2)
    @recip_ing3 = RecipeIngredient.create!(recipe: @recipe1, ingredient: @ingredient3)
  end

  describe "class methods" do
    describe "alphabetically_by_name" do
      it "sorts ingredients alphabetically by name" do
        expect(Ingredient.alphabetically_by_name).to eq([@ingredient1, @ingredient3, @ingredient2, @ingredient4])
      end
    end
  end
end
