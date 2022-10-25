require "rails_helper"

RSpec.describe "recipes show page" do

  before:each do
    @recipe1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
    @recipe2 = Recipe.create!(name: "Shepherd's Pie", complexity: 3, genre: "Irish")
    @ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient2 = Ingredient.create!(name: "Salt", cost: 4)    
    @ingredient3 = Ingredient.create!(name: "Onion", cost: 1)    
    @ingredient4 = Ingredient.create!(name: "Tomato", cost: 3) 
    @recip_ing1 = RecipeIngredient.create!(recipe: @recipe1, ingredient: @ingredient1)
    @recip_ing2 = RecipeIngredient.create!(recipe: @recipe1, ingredient: @ingredient2)
    @recip_ing3 = RecipeIngredient.create!(recipe: @recipe1, ingredient: @ingredient3)
  end

  it "a recipes show page shows a recipes name, complexity and genre" do

    visit "/recipes/#{@recipe1.id}"
    expect(page).to have_content(@recipe1.name)
    expect(page).to have_content(@recipe1.complexity)
    expect(page).to have_content(@recipe1.genre)
    expect(page).to have_no_content(@recipe2.name)
  end

  it "has a list of the names of the ingredients for this recipe" do

    visit "/recipes/#{@recipe1.id}"

    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
    expect(page).to have_no_content(@ingredient4.name)
  end

  it "should show the total cost of ingredients to make the recipe" do
    
    visit "/recipes/#{@recipe1.id}"

    within("total_cost-#{@recipe1.id}")
    expect(page).to have_content("Total Cost: 7")
  end
end