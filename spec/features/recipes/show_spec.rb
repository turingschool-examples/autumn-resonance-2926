require 'rails_helper'

RSpec.describe 'recipe show page' do
  before :each do
    @ingredient1 = Ingredient.create!(name: 'Oreos', cost: 2)
    @ingredient2 = Ingredient.create!(name: 'Reeses', cost: 1)
    @ingredient3 = Ingredient.create!(name: 'Vanilla Ice Cream', cost: 4)
    @recipe1 = Recipe.create!(name: 'Halloween Bucket', complexity: 1, genre: 'Halloween')
    @recipe2 = Recipe.create!(name: 'Ice Cream Sundae', complexity: 2, genre: 'Dessert')
    @recipe_ingredients1 = RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @ingredient1.id)
    @recipe_ingredients2 = RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @ingredient2.id)
    @recipe_ingredients3 = RecipeIngredient.create!(recipe_id: @recipe2.id, ingredient_id: @ingredient1.id)
    @recipe_ingredients4 = RecipeIngredient.create!(recipe_id: @recipe2.id, ingredient_id: @ingredient2.id)
    @recipe_ingredients5 = RecipeIngredient.create!(recipe_id: @recipe2.id, ingredient_id: @ingredient3.id)
  end
  describe '/recipes/:id' do
    it 'sees the recipes attributes' do
      visit "/recipes/#{@recipe1.id}"

      expect(current_path).to eq("/recipes/#{@recipe1.id}")
      expect(page).to have_content(@recipe1.name)
      expect(page).to have_content(@recipe1.complexity)
      expect(page).to have_content(@recipe1.genre)
    end

    it 'sees a list of all names for ingredients for recipe' do
      visit "/recipes/#{@recipe1.id}"

      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
    end
  end
end
