# As a visitor,
# When I visit '/recipes/:id',
# Then I see the recipe's name, complexity and genre,
# and I see a list of the names of the ingredients for the recipe.

require 'rails_helper'

RSpec.describe 'On the Recipes Show Page' do
  describe 'When I visit /recipes/:id' do
    before(:each) do
      @carrots = Ingredient.create!(name: "Carrots", cost: 2)
      @onions = Ingredient.create!(name: "Onions", cost: 3)
      @cellery = Ingredient.create!(name: "Cellery", cost: 3)
      @stock = Recipe.create!(name: "Stock", complexity: 2, genre: "basic")
      RecipeIngredient.create!(recipe: @stock, ingredient: @carrots)
      RecipeIngredient.create!(recipe: @stock, ingredient: @onions)
      RecipeIngredient.create!(recipe: @stock, ingredient: @cellery)
    end
    describe 'Then I see' do
      it 'The recipes name, complexity, and genre' do
        visit "/recipes/#{@stock.id}"
        save_and_open_page
        expect(page).to have_content(@stock.name)
        expect(page).to have_content(@stock.complexity)
        expect(page).to have_content(@stock.genre)
      end

      it 'A list of the names of the ingredients for the recipe' do
        visit "/recipes/#{@stock.id}"

        expect(page).to have_content(@carrots.name)
        expect(page).to have_content(@onions.name)
        expect(page).to have_content(@cellery.name)
      end

      it "A list of the total cost of all ingredients in the recipe" do
        visit "/recipes/#{@stock.id}"

        number = (@carrots.cost + @onions.cost + @cellery.cost)
        expect(page).to have_content("Total Cost: #{number}")
      end
    end
  end
end