require "rails_helper"


RSpec.describe("Ingredients Show page") do
  before(:each) do
    @reciepe1 = Recipe.create!(    name: "Pasta",     complexity: 2,     genre: "Italian")
    @reciepe2 = Recipe.create!(    name: "Tacos",     complexity: 5,     genre: "Mexican")
    @reciepe3 = Recipe.create!(    name: "Cheeseburgers",     complexity: 6,     genre: "American")
    @ing1 = Ingredient.create!(    name: "Salt",     cost: 4)
    @ing2 = Ingredient.create!(    name: "Pepper",     cost: 6)
    @ing3 = Ingredient.create!(    name: "Ground Beef",     cost: 10)
    @ing_rec1 = RecipeIngredient.create!(    ingredient_id: @ing1.id,     recipe_id: @reciepe1.id)
  end

  it("can shows the recipes name, complexity,genre") do
    visit("/recipes/#{@reciepe1.id}")
    expect(page).to(have_content("Name:#{@reciepe1.name}"))
    expect(page).to(have_content("Complexity:#{@reciepe1.complexity}"))
    expect(page).to(have_content("Genre:#{@reciepe1.genre}"))
    expect(page).to(have_content("Ingredients:#{@ing1.name}"))
  end
end
