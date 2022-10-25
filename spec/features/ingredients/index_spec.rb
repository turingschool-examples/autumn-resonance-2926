require 'rails_helper'

RSpec.describe 'the ingredients index' do
  it 'lists all ingredients with their name and cost' do
    ground_beef = Ingredient.create!(name: "Ground Beef", cost: 2)
    salt = Ingredient.create(name: "Salt", cost: 4)
    require "pry"; binding.pry
    visit "/ingredients"

    expect(page).to have_content("#{ground_beef.name}: #{ground_beef.cost}")
    expect(page).to have_content("#{salt.name}: #{salt.cost}")
    save_and_open_page
  end
end
