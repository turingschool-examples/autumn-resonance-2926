# As a visitor,
# When I visit '/recipes/:id',
# Then I see the recipe's name, complexity and genre,
# and I see a list of the names of the ingredients for the recipe.

require 'rails_helper'

RSpec.describe 'On the Recipes Show Page' do
  describe 'When I visit /recipes/:id' do
    describe 'Then I see' do
      before(:each) do
        @carrots = Ingredient.create!(name: "Carrots", cost: 2)
        @onions = Ingredient.create!(name: "Onions", cost: 3)
        @cellery = Ingredient.create!(name: "Cellery", cost: 3)
        @stock = Recipe.create!(name: "Stock", complexity: 2, genre: "basic")
        RecipeIngredient.create!(recipe: @stock, ingredient: @carrots)
        RecipeIngredient.create!(recipe: @stock, ingredient: @onions)
        RecipeIngredient.create!(recipe: @stock, ingredient: @cellery)
      end
      it 'the recipes name, complexity, and genre' do
        visit "/recipes/#{@stock.id}"

        expect(page).to have_content(@stock.name)
        expect(page).to have_content(@stock.complexity)
        expect(page).to have_content(@stock.genre)
      end

      it 'a list of the names of the ingredients for the recipe' do
        visit "/recipes/#{@stock.id}"

        expect(page).to have_content(@carrots.name)
        expect(page).to have_content(@onions.name)
        expect(page).to have_content(@cellery.name)
      end

      it "a list of the total cost of all ingredients in the recipe" do
        visit "/recipes/#{@stock.id}"

        number = (@carrots.cost + @onions.cost + @cellery.cost)
        expect(page).to have_content("Total Cost: #{number}")
      end

      it "a form to add an ingredient to this recipe" do
        visit "/recipes/#{@stock.id}"

        expect(page).to have_content('Add Ingredient')
      end
    end

    describe "When I fill in a field with an existing ingredient and click 'Submit'" do
      before(:each) do
        @carrots = Ingredient.create!(name: "Carrots", cost: 2)
        @onions = Ingredient.create!(name: "Onions", cost: 3)
        @cellery = Ingredient.create!(name: "Cellery", cost: 3)
        @stock = Recipe.create!(name: "Stock", complexity: 2, genre: "basic")
      end
      it "it redirected to /recipes/:id" do
        visit "/recipes/#{@stock.id}"
        click_button "Submit"

        expect(current_path).to eq("/recipes/#{@stock.id}")
      end

      it "the new ingredient listed for this recipe" do
        visit "/recipes/#{@stock.id}"
        select('Onions', from: :ingredient)
        click_button "Submit"

        expect(page).to have_content(@onions.name)
      end
    end
  end
end