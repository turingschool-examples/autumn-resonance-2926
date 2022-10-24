require 'rails_helper'

RSpec.describe 'Ingredients index page' do
  it 'shows a list of all ingredients and their associated cost' do
    rice = Ingredient.create!(name: 'rice', cost: 10)
    flour = Ingredient.create!(name: 'flour', cost: 8)
    chicken = Ingredient.create!(name: 'chicken breast', cost: 51)

    visit '/ingredients' 
    
    within("#ingredient-#{rice.id}") do
      expect(page).to have_content(rice.name)
      expect(page).to have_content(rice.cost)
    end
  
    within("#ingredient-#{flour.id}") do
      expect(page).to have_content(flour.name)
      expect(page).to have_content(flour.cost)
    end
    
    within("#ingredient-#{chicken.id}") do
      expect(page).to have_content(chicken.name)
      expect(page).to have_content(chicken.cost)
    end
  end
end