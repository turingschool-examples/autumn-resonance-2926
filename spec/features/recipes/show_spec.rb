require 'rails_helper'

RSpec.describe 'the recipes show page' do
  it 'shows the name/complexity/genre of recipe and lists each ingredient' do
    salt = Ingredient.create!(name: 'Salt', cost: '2')
    beef = Ingredient.create!(name: 'Ground Beef', cost: '6')
    chicken = Ingredient.create!(name: 'Chicken Thighs', cost: '4')
    tomato = Ingredient.create!(name: 'Tomatoes', cost: '3')

    ragu = Recipe.create!(name: 'Ragu Bolognese', complexity: 3, genre: 'Italian')
    vin = Recipe.create!(name: 'Coq Au Vin', complexity: 5, genre: 'French')

    recipe_ingredient1 = RecipeIngredient.create(ingredient_id: salt.id, recipe_id: vin.id)
    recipe_ingredient2 = RecipeIngredient.create(ingredient_id: chicken.id, recipe_id: vin.id)
    recipe_ingredient3 = RecipeIngredient.create(ingredient_id: salt.id, recipe_id: ragu.id)
    recipe_ingredient4 = RecipeIngredient.create(ingredient_id: beef.id, recipe_id: ragu.id)
    recipe_ingredient5 = RecipeIngredient.create(ingredient_id: tomato.id, recipe_id: ragu.id)

    visit "/recipes/#{ragu.id}"

    expect(page).to have_content('Ragu Bolognese')
    expect(page).to have_content('3')
    expect(page).to have_content('Italian')
    expect(page).to have_content('Ground Beef')
    expect(page).to have_content('Tomatoes')
    expect(page).to have_content('Salt')
    
    expect(page).to_not have_content('Chicken Thighs')
  end

  it 'displays the total cost of all the ingredients in the recipe' do
    salt = Ingredient.create!(name: 'Salt', cost: '2')
    beef = Ingredient.create!(name: 'Ground Beef', cost: '6')
    tomato = Ingredient.create!(name: 'Tomatoes', cost: '3')

    ragu = Recipe.create!(name: 'Ragu Bolognese', complexity: 3, genre: 'Italian')

    recipe_ingredient1 = RecipeIngredient.create(ingredient_id: salt.id, recipe_id: ragu.id)
    recipe_ingredient2 = RecipeIngredient.create(ingredient_id: beef.id, recipe_id: ragu.id)
    recipe_ingredient3 = RecipeIngredient.create(ingredient_id: tomato.id, recipe_id: ragu.id)

    visit "/recipes/#{ragu.id}"

    expect(page).to have_content('Total Cost: 11')
  end
end