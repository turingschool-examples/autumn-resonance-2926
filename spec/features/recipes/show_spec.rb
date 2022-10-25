require 'rails_helper'

RSpec.describe 'the recipe show' do
  it "displays the recipe's name, complexity, and genre" do
    pasta = Recipe.create(name: "Pasta", complexity: 2, genre: "Italian")

    visit "/recipes/#{pasta.id}"

    expect(page).to have_content(pasta.name)
    expect(page).to have_content(pasta.complexity)
    expect(page).to have_content(pasta.genre)
  end
  it "displays a list of the names of the ingredients for the recipe" do
    pasta = Recipe.create(name: "Pasta", complexity: 2, genre: "Italian")
    salt = Ingredient.create(name: "Salt", cost: 4)
    flour = Ingredient.create(name: "Flour", cost: 3)
    hot_sauce = Ingredient.create(name: "Hot Sauce", cost: 5)

    RecipeIngredient.create!(ingredient: salt, recipe: pasta)
    RecipeIngredient.create!(ingredient: flour, recipe: pasta)

    visit "/recipes/#{pasta.id}"

    expect(page).to have_content(salt.name)
    expect(page).to have_content(flour.name)
  end
  it "displays the total cost of all of the ingredients in the recipe" do
    pasta = Recipe.create(name: "Pasta", complexity: 2, genre: "Italian")
    salt = Ingredient.create(name: "Salt", cost: 4)
    flour = Ingredient.create(name: "Flour", cost: 3)
    hot_sauce = Ingredient.create(name: "Hot Sauce", cost: 5)

    RecipeIngredient.create!(ingredient: salt, recipe: pasta)
    RecipeIngredient.create!(ingredient: flour, recipe: pasta)

    visit "/recipes/#{pasta.id}"

    expect(page).to have_content("Total Cost: 7")
  end
end
