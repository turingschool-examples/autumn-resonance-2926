require 'rails_helper'

# User Story 1

# As a visitor,
# When I visit '/ingredients'
# I see a list of all the ingredients including their name and cost
# (e.g. "Ground Beef: 2"
#      "Salt: 4")
RSpec.describe 'Recipe ingredients index' do
  before :each do
    @recipe_1 = Recipe.create!(name: 'pasta', complexity: 3, genre: 'Italian')
    @ingredient_1 = @recipe_1.ingredients.create!(name: 'flour', cost: 1)
    @ingredient_2 = @recipe_1.ingredients.create!(name: 'water', cost: 2)
    @ingredient_3 = @recipe_1.ingredients.create!(name: 'salt', cost: 3)
  end
  describe 'when I visit ingredients index page' do
    it 'shows all ingredients including name and cost' do
      
      visit '/ingredients'

      expect(page).to have_content("#{@ingredient_1.name}: #{@ingredient_1.cost}")
      expect(page).to have_content("#{@ingredient_2.name}: #{@ingredient_2.cost}")
      expect(page).to have_content("#{@ingredient_3.name}: #{@ingredient_3.cost}")
    end
  end
end