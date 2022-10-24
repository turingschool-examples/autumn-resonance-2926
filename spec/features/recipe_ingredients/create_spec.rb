require "rails_helper"

RSpec.describe "Creating a new ingredient for a recipe" do 
  describe "As a visitor" do 
    describe "When I visit the recipes show page" do 
      it "displays a form to add an ingredient to the recipe that when submitted adds that ingredient to the recipe" do 
        cheese = Ingredient.create!(name: "Pecorino Cheese", cost: 10)
        pasta = Ingredient.create!(name: "Penne Pasta", cost: 2)
        tomatoes = Ingredient.create!(name: "Tomatoes", cost: 4)
        recipe = Recipe.create!(name: "Pasta Marinara", complexity: 1, genre: "Italian")

        RecipeIngredient.create!(recipe: recipe, ingredient: cheese)
        RecipeIngredient.create!(recipe: recipe, ingredient: pasta)

        visit "/recipes/#{recipe.id}"
        
        within "#ingredients" do 
          expect(page).to_not have_content("- Tomatoes")
        end

        within "#add_ingredient" do 
          expect(page).to have_field("ingredient_id")
          expect(page).to have_button("Submit")

          fill_in "ingredient_id", with: "#{tomatoes.id}"
          click_button("Submit")
        end

        expect(current_path).to eq("/recipes/#{recipe.id}")

        within "#ingredients" do 
          expect(page).to have_content("- Tomatoes")
        end
      end
    end
  end
end