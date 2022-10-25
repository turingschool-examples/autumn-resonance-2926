require 'rails_helper'

RSpec.feature "Ingredients index page", type: :feature do
 describe 'when the page is visited' do
  it 'should display a list of all the ingredients including name and cost' do
    ingredient_1 = Ingredient.create!(name: 'Steak', cost: 10)
    ingredient_2 = Ingredient.create!(name: 'Tomato', cost: 3)
    ingredient_3 = Ingredient.create!(name: 'Carrot', cost: 2)

    visit "/ingredients"

    expect(page).to have_content("Steak: 10")
    expect(page).to have_content("Tomato: 3")
    expect(page).to have_content("Carrot: 2")
  end
 end
end
