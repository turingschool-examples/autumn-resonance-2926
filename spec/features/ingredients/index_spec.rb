require 'rails_helper'

RSpec.describe 'Ingredients' do
  describe '#index' do
    ingredient = Ingredient.create!(name: 'Ground Beef', cost: 2)
    it 'has a list of all the ingredients including name and cost' do
      visit '/ingredients'
      expect(page).to have_content(ingredient.name)
      expect(page).to have_content(ingredient.cost)
      save_and_open_page
    end
  end
end
