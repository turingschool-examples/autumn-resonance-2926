require 'rails_helper'

RSpec.describe "Recipe Show page" do
  describe "As a visitor" do
    describe "When I visit '/recipes/:id'" do
      before :each do
        @omelette = Recipe.create!(name: "Omelette", complexity: 1, genre: "Breakfast")
        @eggs = Ingredient.create!(name: "Eggs", cost: 1)
        @cheese = Ingredient.create!(name: "Cheese", cost: 2)
        @mushrooms = Ingredient.create!(name: "Mushrooms", cost: 2)
        @steak = Ingredient.create!(name: "Steak", cost: 5)

        RecipeIngredient.create!(ingredient: @eggs, recipe: @omelette)
        RecipeIngredient.create!(ingredient: @cheese, recipe: @omelette)
        RecipeIngredient.create!(ingredient: @mushrooms, recipe: @omelette)
        RecipeIngredient.create!(ingredient: @steak, recipe: @omelette)
      end

      it "Then I see the recipe's name, complexity and genre, and I see a list of the names of the ingredients for the recipe." do
        visit "/recipes/#{@omelette.id}"
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

      it "Displays the total cost of all ingredients in the recipe" do
        visit "/recipes/#{@omelette.id}"
        # save_and_open_page
        expect(page).to have_content("Total Cost: 10")
      end

      it "Then I see a form to add an ingredient to this recipe" do
        bacon = Ingredient.create!(name: "Bacon", cost: 3)
        visit "/recipes/#{@omelette.id}"
        # save_and_open_page
        expect(page).to have_content("Add an Ingredient")
        expect(page).to have_content("Ingredient id")
        expect(page).to have_button("Submit")
      end

      describe "When I fill in a field And I click submit," do
        it "I am redirected to the recipe's show page/ingredient" do
          bacon = Ingredient.create!(name: "Bacon", cost: 3)

          visit "/recipes/#{@omelette.id}"
          # save_and_open_page
          fill_in(:ingredient_id, with: bacon.id)
          click_button "Submit"

          expect(current_path).to eq("/recipes/#{@omelette.id}")
          # save_and_open_page
          expect(page).to have_content("Bacon")
          expect(page).to have_content("Total Cost: 13")
        end
      end
    end
  end
end
