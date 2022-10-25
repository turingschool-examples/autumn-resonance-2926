require 'rails_helper'

RSpec.describe 'index' do
  before :each do
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_3 = Ingredient.create!(name: "Apple", cost: 2)
  end

  it "lists all ingredients along with name and cost" do
    visit "/ingredients"

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_1.cost)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_2.cost)
  end

  it "lists all ingredients in alphabetical order" do
    visit "/ingredients"

    expect(@ingredient_3.name).to appear_before(@ingredient_1.name)
    expect(@ingredient_1.name).to appear_before(@ingredient_2.name)
  end
end