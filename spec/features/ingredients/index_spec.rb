require 'rails_helper'

RSpec.describe 'ingredients index', type: :feature do
  let!(:beef) {Ingredient.create!(name: 'Ground Beef', cost: 2)}
  let!(:salt) {Ingredient.create!(name: 'Salt', cost: 4)}

  describe 'the ingredients index page' do
    it 'lists all the ingredients, including their name and cost' do
      visit '/ingredients'
      
      expect(page).to have_content(beef.name)
      expect(page).to have_content(beef.cost)
      expect(page).to have_content(salt.name)
      expect(page).to have_content(salt.cost)
    end
  end
end