require 'rails_helper'

RSpec.feature "Ingredients index page", type: :feature do
 describe 'when the page is visited' do
  before :each do
    @ingredient_1 = Ingredient.create!(name: 'Steak', cost: 10)
    @ingredient_2 = Ingredient.create!(name: 'Tomato', cost: 3)
    @ingredient_3 = Ingredient.create!(name: 'Carrot', cost: 2)
  end
  it 'should display a list of all the ingredients including name and cost' do
    visit "/ingredients"

    expect(page).to have_content("Steak: 10")
    expect(page).to have_content("Tomato: 3")
    expect(page).to have_content("Carrot: 2")
  end

  it 'should display the ingredients in alphabetical order' do
    visit "/ingredients"

    expect("Carrot").to appear_before("Steak")
    expect("Steak").to appear_before("Tomato")
  end
 end
end
