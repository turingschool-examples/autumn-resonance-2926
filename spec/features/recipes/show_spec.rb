require "rails_helper"

RSpec.describe "Recipes show page" do 
  describe "As a visitor" do 
    describe "When I visit '/recipes/:id'" do 
      it "displays the total cost of all teh ingredients in the recipe" do 
        cheese = Ingredient.create!(name: "Pecorino Cheese", cost: 10)
        pasta = Ingredient.create!(name: "Penne Pasta", cost: 2)
        tomatoes = Ingredient.create!(name: "Tomatoes", cost: 4)
        pasta_recipe = Recipe.create!(name: "Pasta Marinara", complexity: 1, genre: "Italian")

        RecipeIngredient.create!(recipe: pasta_recipe, ingredient: cheese)
        RecipeIngredient.create!(recipe: pasta_recipe, ingredient: pasta)
        RecipeIngredient.create!(recipe: pasta_recipe, ingredient: tomatoes)

        visit "/recipes/#{pasta_recipe.id}"
      
        expect(page).to have_content("Name: Pasta Marinara")
        expect(page).to have_content("Complexity: 1")
        expect(page).to have_content("Genre: Italian")

        within "#ingredients" do 
          expect(page).to have_content("Ingredients:")
          expect(page).to have_content("- Penne Pasta")
          expect(page).to have_content("- Tomatoes")
          expect(page).to have_content("- Pecorino Cheese")
        end
      end
    end
  end
end