require 'rails_helper'

RSpec.feature "Recipe show page", type: :feature do
 describe 'when the page is visited' do
  before :each do
    @recipe = Recipe.create!(name: "Steak Stew", complexity: 2, genre: "American")
    @ingredient_1 = @recipe.ingredients.create!(name: 'Steak', cost: 10)
    @ingredient_2 = @recipe.ingredients.create!(name: 'Tomato', cost: 3)
    @ingredient_3 = @recipe.ingredients.create!(name: 'Carrot', cost: 2)
  end
  it 'should display a list of all the ingredients including name and cost' do
    visit "/recipes/#{recipe.id}"

    expect(page).to have_content("Steak Stew")
    expect(page).to have_content("Complexity: 2")
    expect(page).to have_content("Genre: American")

    within "#ingredients" do
      expect(page).to have_content("Steak")
      expect(page).to have_content("Tomato")
      expect(page).to have_content("Carrot")
    end
  end

  it 'should show the total cost of all of the recipe ingredients' do
    visit "/recipes/#{recipe.id}"

    expect(page).to have_content("Total Cost: #{@ingredient_1.cost + @ingredient_2.cost + @ingredient_3.cost}")
  end
 end
end
