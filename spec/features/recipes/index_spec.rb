require 'rails_helper'

RSpec.describe 'Recipes' do
  describe '#index' do
    food = Recipe.create!(name: 'spaghetti', complexity: 2, genre: 'italian')
    it 'has a list of all recipes' do
      visit '/recipes'
      expect(page).to have_content(food.name)
      expect(page).to have_link(food.name)
      first(:link, food.name).click
      expect(current_path).to eq("/recipes/#{food.id}")
    end
  end
end