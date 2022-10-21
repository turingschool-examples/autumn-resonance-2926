require 'rails_helper'
# User Story 2

# As a visitor,
# When I visit '/recipes/:id',
# Then I see the recipe's name, complexity and genre,
# and I see a list of the names of the ingredients for the recipe.
RSpec.describe 'recipes show page' do
  # before :each do
  # end
  describe 'As a visitor' do
    describe 'when I visit recipes show page' do
      it 'shows the recipe name with attributes and list of ingredients' do
        @recipe_1 = Recipe.create!(name: 'pasta', complexity: 3, genre: 'Italian')
        @ingredient_1 = @recipe_1.ingredients.create!(name: 'flour', cost: 1)
        @ingredient_2 = @recipe_1.ingredients.create!(name: 'water', cost: 2)
        @ingredient_3 = @recipe_1.ingredients.create!(name: 'salt', cost: 3)
        visit "/recipes/#{@recipe_1.id}"

     
        expect(page).to have_content("#{@recipe_1.name}")
        expect(page).to have_content("#{@recipe_1.complexity}")
        expect(page).to have_content("#{@recipe_1.genre}")
        expect(page).to have_content("#{@ingredient_1.name}")
        expect(page).to have_content("#{@ingredient_2.name}")
        expect(page).to have_content("#{@ingredient_3.name}")
      end
      it 'shows total cost of ingredients on show page' do
        @recipe_1 = Recipe.create!(name: 'pasta', complexity: 3, genre: 'Italian')
        @ingredient_1 = @recipe_1.ingredients.create!(name: 'flour', cost: 1)
        @ingredient_2 = @recipe_1.ingredients.create!(name: 'water', cost: 2)
        @ingredient_3 = @recipe_1.ingredients.create!(name: 'salt', cost: 3)
        visit "/recipes/#{@recipe_1.id}"

        expect(page).to have_content("Total Cost: 6")
      end
    end
  end
end