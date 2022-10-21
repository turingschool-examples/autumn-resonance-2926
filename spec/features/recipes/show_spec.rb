require 'rails_helper'

RSpec.describe 'recipe show page', type: :feature do
  let!(:lasagna) {Recipe.create!(name: 'Lasagna', complexity: 3, genre: "Italian")}
  let!(:beef) {Ingredient.create!(name: 'Ground Beef', cost: 2)}
  let!(:salt) {Ingredient.create!(name: 'Salt', cost: 4)}

  describe 'when a user checks the recipe show page' do
    before :each do
      RecipeIngredient.create(recipe: lasagna, ingredient: beef)
      RecipeIngredient.create(recipe: lasagna, ingredient: salt)
    end
    it 'shows the recipe name, complexity, and genre, and list of ingredients for that recipe' do
      visit "/recipes/#{lasagna.id}"
      save_and_open_page
      expect(page).to have_content(lasagna.name)
      expect(page).to have_content(lasagna.complexity)
      expect(page).to have_content(lasagna.genre)
      expect(page).to have_content(beef.name)
      expect(page).to have_content(salt.name)
    end
  end
end