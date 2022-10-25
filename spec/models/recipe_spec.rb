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

  describe 'ingredient total cost' do 
    it "#ingredient_total" do 
      recipe = Recipe.create!(name:"Tacos", complexity: "Easy", genre: "Mexican")
      pie = Recipe.create!(name:"Pie", complexity: "Easy", genre: "Dessert")

      ground_beef = Ingredient.create!(name:"Ground Beef", cost: 2)
      salt = Ingredient.create!(name:"Salt", cost: 4)
      tortilla = Ingredient.create!(name:"Tortillas", cost: 3)
      milk = Ingredient.create!(name:"Milk", cost: 5)

      recipe_ingredients_1 = RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: ground_beef.id)
      recipe_ingredients_2 = RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: salt.id)
      recipe_ingredients_3 = RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: tortilla.id)
      recipe_ingredients_4 = RecipeIngredient.create!(recipe_id: pie.id, ingredient_id: milk.id)

      expect(recipe.ingredients_total).to eq(9)


    end
  end
end
