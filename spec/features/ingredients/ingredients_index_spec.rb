require 'rails_helper'

RSpec.describe Ingredient, type: :feature do
  describe 'When I visit /ingredients' do
    it 'has a list of all the ingredients including their name and cost' do 
      ground_beef = Ingredient.create!(name:"Ground Beef", cost: 2)
      salt = Ingredient.create!(name:"Salt", cost: 4)
      pepper = Ingredient.create!(name:"Pepper", cost: 3)
      
      visit('/ingredients')
      
      within "#ingredients-#{ground_beef.id}" do
      expect(page).to have_content("Ground Beef")
      expect(page).to have_content(2)
      end

      within "#ingredients-#{salt.id}" do
      expect(page).to have_content("Salt")
      expect(page).to have_content(4)
      end

      within "#ingredients-#{pepper.id}" do
      expect(page).to have_content("Pepper")
      expect(page).to have_content(3)
      end
    end
  end 
end