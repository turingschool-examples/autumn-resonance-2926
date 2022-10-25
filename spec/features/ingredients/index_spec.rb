require "rails_helper"


RSpec.describe("Ingredients Index page") do
  before(:each) do
    @ing1 = Ingredient.create!(    name: "Salt",     cost: 4)
    @ing2 = Ingredient.create!(    name: "Pepper",     cost: 6)
    @ing3 = Ingredient.create!(    name: "Ground Beef",     cost: 10)
  end

  it("i see a list of all Ingredients w/ name and cost") do
    visit("/ingredients")
    expect(page).to(have_content("Ingredient: #{@ing1.name}"))
    expect(page).to(have_content("Cost: #{@ing1.cost}"))
    expect(page).to(have_content("Ingredient: #{@ing2.name}"))
    expect(page).to(have_content("Cost: #{@ing2.cost}"))
    expect(page).to(have_content("Ingredient: #{@ing3.name}"))
    expect(page).to(have_content("Cost: #{@ing3.cost}"))
  end
end
