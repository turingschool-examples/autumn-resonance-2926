require 'rails_helper'

RSpec.describe 'the ingredients index page' do
  it 'lists the name and cost of each ingredient' do
    salt = Ingredient.create!(name: 'Salt', cost: '2')
    beef = Ingredient.create!(name: 'Ground Beef', cost: '6')
    chicken = Ingredient.create!(name: 'Chicken Thighs', cost: '4')

    visit '/ingredients'

    within "#ingredients-#{salt.id}" do
      expect(page).to have_content('Salt')
      expect(page).to have_content('2')
    end

    within "#ingredients-#{beef.id}" do
      expect(page).to have_content('Ground Beef')
      expect(page).to have_content('6')
    end

    within "#ingredients-#{chicken.id}" do
      expect(page).to have_content('Chicken Thighs')
      expect(page).to have_content('4')
    end
  end

  it 'lists the ingredients in alphabetical order' do
    salt = Ingredient.create!(name: 'Salt', cost: '2')
    beef = Ingredient.create!(name: 'Ground Beef', cost: '6')
    chicken = Ingredient.create!(name: 'Chicken Thighs', cost: '4')

    visit '/ingredients'

    expect('Chicken Thighs').to appear_before('Ground Beef', only_text: true)
    expect('Ground Beef').to appear_before('Salt', only_text: true)
  end
  
  
end