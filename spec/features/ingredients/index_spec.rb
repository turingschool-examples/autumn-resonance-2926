require 'rails_helper'

RSpec.describe 'ingredient index page' do 
  before(:each) do
    @beef = Ingredient.create!(name: 'Ground Beef', cost: 2)
    @salt = Ingredient.create!(name: 'Salt', cost: 4)
    @lettuce = Ingredient.create!(name: 'Lettuce', cost: 1)
  end
  
  it 'lists all ingredients and their costs' do 
    visit '/ingredients'

    expect(page).to have_content("#{@beef.name}: #{@beef.cost}")
    expect(page).to have_content("#{@salt.name}: #{@salt.cost}")
  end

  it 'sorts ingredients alphabetically' do 
    visit '/ingredients'

    expect(@lettuce.name).to appear_before(@salt.name)
    expect(@beef.name).to appear_before(@lettuce.name)
  end
end