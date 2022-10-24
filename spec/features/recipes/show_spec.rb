require 'rails_helper'

RSpec.describe 'Recipe show page' do
  it 'shows the recipe name, complexity, genre, and list of ingredients' do
    recipe_1 = Recipe.create(name: 'Spaghetti', complexity: 5, genre: 'Italian')
    meatballs = Ingredient.create!(name: 'meatballs', cost: 14)
    spaghetti = Ingredient.create!(name: 'pasta', cost: 2)
    sauce = Ingredient.create!(name: 'sauce', cost: 7)
    recipe_ingredients_1 = RecipeIngredient.create!(recipe: recipe_1, ingredient: meatballs)
    recipe_ingredients_2 = RecipeIngredient.create!(recipe: recipe_1, ingredient: spaghetti)
    recipe_ingredients_3 = RecipeIngredient.create!(recipe: recipe_1, ingredient: sauce)

    visit "/recipes/#{recipe_1.id}"

    expect(page).to have_content(recipe_1.name)
    expect(page).to have_content(recipe_1.complexity)
    expect(page).to have_content(recipe_1.genre)
    expect(page).to have_content(meatballs.name)
    expect(page).to have_content(spaghetti.name)
    expect(page).to have_content(sauce.name)
  end
end