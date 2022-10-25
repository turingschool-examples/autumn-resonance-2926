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

  describe 'instance methods' do
    describe '#total_cost' do
      it '-returns the total cost of a specific recipes ingredients' do 
        ground_beef = Ingredient.create!(name: "Ground Beef", cost: 2)
        salt = Ingredient.create!(name: "Salt", cost: 4)
        pasta = Ingredient.create!(name: "Pasta", cost: 3)
        tomato_paste = Ingredient.create!(name: "Tomato Paste", cost: 2)
        butter = Ingredient.create!(name: "Butter", cost: 5)
        chicken = Ingredient.create!(name: "Chicken", cost: 10)
        orzo = Ingredient.create!(name: "Orzo", cost: 3)
        feta = Ingredient.create!(name: "Feta Cheese", cost: 7)

        spaghetti = Recipe.create!(name: "Spaghetti", complexity: 1, genre: "Italian")
        chicken_orzo = Recipe.create!(name: "Chicken Orzo", complexity: 3, genre: "Greek")

        RecipeIngredient.create!(recipe: spaghetti, ingredient: ground_beef)
        RecipeIngredient.create!(recipe: spaghetti, ingredient: salt)
        RecipeIngredient.create!(recipe: spaghetti, ingredient: pasta)
        RecipeIngredient.create!(recipe: spaghetti, ingredient: tomato_paste)
        RecipeIngredient.create!(recipe: spaghetti, ingredient: butter)
        RecipeIngredient.create!(recipe: chicken_orzo, ingredient: butter)
        RecipeIngredient.create!(recipe: chicken_orzo, ingredient: salt)
        RecipeIngredient.create!(recipe: chicken_orzo, ingredient: chicken)
        RecipeIngredient.create!(recipe: chicken_orzo, ingredient: orzo)
        RecipeIngredient.create!(recipe: chicken_orzo, ingredient: feta)

        expect(spaghetti.total_cost).to eq(16)
        expect(chicken_orzo.total_cost).to eq(29)
      end
    end
  end
end
