require "rails_helper"

RSpec.describe "recipes show page" do
  before :each do
    @recipe_1 = Recipe.create!(name: "That good good", complexity: 9, genre: "Taiwanese")
    @recipe_2 = Recipe.create!(name: "That bomb good", complexity: 10, genre: "Taiwanese")
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
    @recipe_ingredient_1 = RecipeIngredient.create(ingredient: @ingredient_1, recipe: @recipe_1)
  end

  it "see recipe's name complexity and genre " do
    visit "/recipes/#{@recipe_1.id}"
    expect(page).to have_content(@recipe_1.name)
    expect(page).to have_content(@recipe_1.complexity)
    expect(page).to have_content(@recipe_1.genre)
  end

  it "see list of ingredient for that recipe" do
    visit "/recipes/#{@recipe_1.id}"
    expect(page).to have_content("Ingredients")
    expect(page).to have_content(@recipe_ingredient_1.ingredient.name)
  end
end
