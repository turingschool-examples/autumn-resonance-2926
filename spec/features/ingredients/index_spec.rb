require 'rails_helper'

RSpec.describe 'index' do
  before :each do
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
    #I really wanna visit wherever it is that those prices are like that!
  end

   it "lists all ingredients along with name and cost" do
    visit "/ingredients"

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_1.cost)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_2.cost)
   end
end