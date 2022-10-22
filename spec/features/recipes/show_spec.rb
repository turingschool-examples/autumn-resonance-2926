# User Story 2

# As a visitor,
# When I visit '/recipes/:id',
# Then I see the recipe's name, complexity and genre,
# and I see a list of the names of the ingredients for the recipe.
require 'rails_helper'

RSpec.describe "User Story 2" do
  describe "As a visitor" do
    describe "When I visit '/recipes/:id'" do
      it "Then I see the recipe's name, complexity and genre, and I see a list of the names of the ingredients for the recipe." do
        omelette = Recipe.create!(name: "Omelette", complexity: 1, genre: "Breakfast")
        eggs = Ingredient.create!(name: "Eggs", cost: 1)
        cheese = Ingredient.create!(name: "Cheese", cost: 2)
        mushrooms = Ingredient.create!(name: "Mushrooms", cost: 2)
        steak = Ingredient.create!(name: "Steak", cost: 5)

        RecipeIngredient.create!(ingredient: eggs, recipe: omelette)
        RecipeIngredient.create!(ingredient: cheese, recipe: omelette)
        RecipeIngredient.create!(ingredient: mushrooms, recipe: omelette)
        RecipeIngredient.create!(ingredient: steak, recipe: omelette)

        visit "/recipes/#{omelette.id}"
        # save_and_open_page
        expect(page).to have_content("Omelette")
        expect(page).to have_content("Complexity: 1")
        expect(page).to have_content("Breakfast")
        expect(page).to have_content("Ingredients")
        expect(page).to have_content("Eggs")
        expect(page).to have_content("Cheese")
        expect(page).to have_content("Mushrooms")
        expect(page).to have_content("Steak")
      end
    end
  end
end
