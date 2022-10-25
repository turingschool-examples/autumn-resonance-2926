require 'rails_helper'

RSpec.describe 'ingredients index' do
  before :each do
    @ingredient1 = Ingredient.create!(name: 'Oreos', cost: 2)
    @ingredient2 = Ingredient.create!(name: 'Reeses', cost: 1)
    @ingredient3 = Ingredient.create!(name: 'Vanilla Ice Cream', cost: 4)
    @recipe1 = Recipe.create!(name: 'Halloween Bucket', complexity: 1, genre: 'Halloween')
    @recipe2 = Recipe.create!(name: 'Ice Cream Sundae', complexity: 2, genre: 'Dessert')
    RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @ingredient1.id)
    RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @ingredient2.id)
    RecipeIngredient.create!(recipe_id: @recipe2.id, ingredient_id: @ingredient1.id)
    RecipeIngredient.create!(recipe_id: @recipe2.id, ingredient_id: @ingredient2.id)
    RecipeIngredient.create!(recipe_id: @recipe2.id, ingredient_id: @ingredient3.id)
  end
  describe 'when I visit /ingredients' do
    it 'sees a list of all ingredients with their name and cost' do
      visit '/ingredients'

      expect(current_path).to eq('/ingredients')
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient1.cost)
      expect(page).to have_content(@ingredient2.name)
      expect(page).to have_content(@ingredient2.cost)
    end

    it 'sees a list of all ingredients sorted alphabetically by name' do
      visit '/ingredients'

      expect(@ingredient1.name).to appear_before(@ingredient2.name)
      expect(@ingredient2.name).to appear_before(@ingredient3.name)
      expect(@ingredient3.name).to_not appear_before(@ingredient1.name)
    end
  end
end
