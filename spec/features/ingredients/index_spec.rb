require "rails_helper" 

RSpec.describe "the ingredients index page" do

  before:each do
    @ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient2 = Ingredient.create!(name: "Salt", cost: 4)    
    @ingredient3 = Ingredient.create!(name: "Apples", cost: 1)    
  end

  it "shows a list of all the ingredients including their name and cost" do

    visit "/ingredients"

    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient1.cost)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient2.cost)

  end

  it "lists the ingredients in alphabetical order" do
    visit "/ingredients"

    expect(@ingredient1.name).to appear_before(@ingredient2.name)
    expect(@ingredient3.name).to appear_before(@ingredient2.name)
    expect(@ingredient2.name).to_not appear_before(@ingredient1.name)
  end
end