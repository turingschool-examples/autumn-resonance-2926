require "rails_helper" 

RSpec.describe "the ingredients index page" do

  before:each do
    @ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient2 = Ingredient.create!(name: "Salt", cost: 4)    
  end

  it "shows a list of all the ingredients including their name and cost" do

    visit "/ingredients"

    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient1.cost)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient2.cost)

  end
end