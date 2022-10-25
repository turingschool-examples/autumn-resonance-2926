require 'rails_helper'

RSpec.describe 'Ingredients' do
  describe '#index' do
    it 'has a list of all the ingredients including name and cost' do
      ingredient = Ingredient.create!(name: 'Ground Beef', cost: 2)
      visit '/ingredients'
      expect(page).to have_content(ingredient.name)
      expect(page).to have_content(ingredient.cost)
    end
  end
end
