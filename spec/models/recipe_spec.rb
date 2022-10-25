require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :complexity }
    it { should validate_presence_of :genre }
  end

  describe 'relationships' do
    it { should have_many :recipe_ingredients }
    it { should have_many(:ingredients).through(:recipe_ingredients) }
  end

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

  it 'can sum the cost of ingredients' do
    expect(@recipe1.ingredient_cost).to eq(3)
  end
end
