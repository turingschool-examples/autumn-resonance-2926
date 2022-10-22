require 'rails_helper'

RSpec.describe 'Ingredients' do
  describe '#show' do
    dish = Recipe.create!(name: 'nachos', complexity: 10, genre: 'good')
    dish.ingredients.create!(name: 'chips', cost: 1)
    dish.ingredients.create!(name: 'cheese', cost: 2)
    it 'shows a recipes name, complexity and genre' do
      visit "/recipes/#{dish.id}"
      expect(page).to have_content(dish.name)
      expect(page).to have_content(dish.complexity)
      expect(page).to have_content(dish.genre)
      expect(page).to have_content('chips')
      expect(page).to have_content('cheese')
      # save_and_open_page
    end

    it 'shows a recipe ingredients total cost' do
      visit "/recipes/#{dish.id}"
      expect(page).to have_content(3)
    end


  end

end