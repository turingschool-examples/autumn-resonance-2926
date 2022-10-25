require 'rails_helper'

RSpec.describe 'recipe show page - /recipes/:id/show.html.erb', type: :feature do
  describe 'as a user' do
    describe 'when I visit the recipe show page' do
      it '- shows the recipes name, complexity, and genre. I also see a list of the names of the ingredients for the recipe' do
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

        visit "/recipes/#{spaghetti.id}"

        expect(page).to have_content(spaghetti.name)
        expect(page).to have_content(spaghetti.complexity)
        expect(page).to have_content(spaghetti.genre)
        expect(page).to have_content(ground_beef.name)
        expect(page).to have_content(salt.name)
        expect(page).to have_content(pasta.name)
        expect(page).to have_content(tomato_paste.name)
        expect(page).to have_content(butter.name)
        expect(page).to_not have_content(chicken_orzo.name)
        expect(page).to_not have_content(chicken_orzo.complexity)
        expect(page).to_not have_content(chicken_orzo.genre)
        expect(page).to_not have_content(chicken.name)
        expect(page).to_not have_content(orzo.name)
      end

      it '- I see the total cost of all of the ingredients in the recipe' do
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

        visit "/recipes/#{chicken_orzo.id}"

        expect(
      end
    end
  end
end