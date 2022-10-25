require 'rails_helper'

RSpec.describe 'index' do
  before :each do
    @recipe_1 = Recipe.create!(name: "Burger", complexity: 2, genre: "what?")
    @recipe_2 = Recipe.create!(name: "Lasagna", complexity: 6, genre: "why?")
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 4)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 1)
    @ingredient_3 = Ingredient.create!(name: "Onions", cost: 3)
    @ingredient_4 = Ingredient.create!(name: "Pasta", cost: 2)
    @recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_1.id)
    @recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_2.id)
    @recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_3.id)
    @recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ingredient_1.id)
    @recipe_ingredient_5 = RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ingredient_2.id)
    @recipe_ingredient_6 = RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ingredient_3.id)
    @recipe_ingredient_7 = RecipeIngredient.create!(recipe_id: @recipe_2.id, ingredient_id: @ingredient_4.id)
  end

   it "lists all ingredients along with name, complexity, and genre" do
    visit "/recipes/#{@recipe_1.id}"

    expect(page).to have_content(@recipe_1.name)
    expect(page).to_not have_content(@recipe_2.name)
    expect(page).to have_content(@ingredient_1.name, count: 1)
    expect(page).to have_content(@ingredient_2.name, count: 1)
    expect(page).to have_content(@ingredient_3.name, count: 1)
    expect(page).to_not have_content(@ingredient_4.name)
   end

   it "shows the total cost of all the ingredients added together" do
    visit "/recipes/#{@recipe_1.id}"

    expect(page).to have_content("Total Cost")
    expect(page).to have_content(8)
   end

   it "has a form to add a new ingredient to the recipe" do
    visit "/recipes/#{@recipe_1.id}"

    expect(page).to have_selector(:css, "form")

    fill_in :ingredient_id, with: @ingredient_4.id
    click_on "Submit"


    expect(page.current_path).to eql("/recipes/#{@recipe_1.id}")
    expect(page).to have_content(@ingredient_4.name)
   end
end