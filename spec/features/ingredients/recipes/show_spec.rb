require 'rails_helper'

# User Story 2
# As a visitor,
# When I visit '/recipes/:id',
# Then I see the recipe's name, complexity and genre,
# and I see a list of the names of the ingredients for the recipe.

RSpec.describe Recipe do 
   describe 'when I visit recipes/:id I see information' do 
     it 'Has the recipes name, complexity, and genre listed' do
      recipe = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2)
      ingredient2 = Ingredient.create!(name: "Pasta", cost: 3)
      ingredient3 = Ingredient.create!(name: "Salt", cost: 4)
      ingredient4 = Ingredient.create!(name: "Sauce", cost: 5)
      ingredients = Ingredient.all
      visit "/recipes/#{recipe.id}"

      expect(page).to have_content(recipe.name)
      expect(page).to have_content(recipe.complexity)
      expect(page).to have_content(recipe.genre)
     
     end
   end

   it 'lists recipes in ingredients' do 
      recipe = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2)
      ingredient2 = Ingredient.create!(name: "Pasta", cost: 3)
      ingredient2 = Ingredient.create!(name: "Salt", cost: 4)
      ingredient2 = Ingredient.create!(name: "Sauce", cost: 5)
      ingredients = Ingredient.all
      visit "/recipes/#{recipe.id}"

    
   end



end