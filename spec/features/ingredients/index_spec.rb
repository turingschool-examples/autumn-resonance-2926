require 'rails_helper'

RSpec.describe 'ingredients index', type: :feature do
  let!(:pepper) {Ingredient.create!(name: 'Pepper', cost: 1)}
  let!(:beef) {Ingredient.create!(name: 'Ground Beef', cost: 2)}
  let!(:tomato) {Ingredient.create!(name: 'Tomato', cost: 3)}
  let!(:salt) {Ingredient.create!(name: 'Salt', cost: 4)}

  describe 'the ingredients index page' do
    it 'lists all the ingredients, including their name and cost' do
      visit '/ingredients'
      
      expect(page).to have_content(beef.name)
      expect(page).to have_content(beef.cost)
      expect(page).to have_content(salt.name)
      expect(page).to have_content(salt.cost)
    end

    it 'lists ingredients in alphabetical order' do
      visit '/ingredients' 

      expect(beef.name).to appear_before(pepper.name)
      expect(pepper.name).to appear_before(salt.name)
      expect(salt.name).to appear_before(tomato.name)
    end
  end
end