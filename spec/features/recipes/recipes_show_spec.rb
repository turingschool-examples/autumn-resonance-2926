require 'rails_helper'

RSpec.describe Recipe, type: :feature do
  describe 'When I visit /recipes/:id' do
    it 'has a Recipe name, genre, complexity and a list of all the ingredients' do 
      taco = Recipe.create!(name:"Tacos", complexity: "Easy", genre: "Mexican")
      pie = Recipe.create!(name:"Pie", complexity: "Easy", genre: "Dessert")

      ground_beef = Ingredient.create!(name:"Ground Beef", cost: 2)
      salt = Ingredient.create!(name:"Salt", cost: 4)
      tortilla = Ingredient.create!(name:"Tortillas", cost: 3)
      milk = Ingredient.create!(name:"Milk", cost: 5)

      recipe_ingredients_1 = RecipeIngredient.create!(recipe_id: taco.id, ingredient_id: ground_beef.id)
      recipe_ingredients_2 = RecipeIngredient.create!(recipe_id: taco.id, ingredient_id: salt.id)
      recipe_ingredients_3 = RecipeIngredient.create!(recipe_id: taco.id, ingredient_id: tortilla.id)
      recipe_ingredients_4 = RecipeIngredient.create!(recipe_id: pie.id, ingredient_id: milk.id)

      visit "/recipes/#{taco.id}"

      expect(page).to have_content("Tacos")
      expect(page).to have_content("Salt")
      expect(page).to have_content("Tortillas")
      expect(page).to_not have_content("Milk")
    end 

    it "displaus the total cost of all of the ingredients in the recipe" do 
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
      
      visit "/recipes/#{recipe.id}"
      
      expect(page).to have_content("Total Cost: 9")


    end
  end



end