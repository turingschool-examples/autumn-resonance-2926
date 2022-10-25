require 'rails_helper'

# User Story 1
# As a visitor,
# When I visit '/ingredients'
# I see a list of all the ingredients including their name and cost
# (e.g. "Ground Beef: 2"
# "Salt: 4")
RSpec.describe "Ingredients" do 
   describe 'ingredients#index' do 
    it 'as a visitor of ingredients I see their name and cost' do
     ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2)
     ingredient2 = Ingredient.create!(name: "Salt", cost: 4)
     visit "/ingredients"

     expect(page).to have_content("Ground Beef")
     expect(page).to have_content(2)
     expect(page).to have_content("Salt")
     expect(page).to have_content(4)
     expect(page).to_not have_content("Milk")
    end

   end

end