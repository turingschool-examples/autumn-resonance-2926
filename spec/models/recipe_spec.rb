require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let!(:lasagna) {Recipe.create!(name: 'Lasagna', complexity: 3, genre: "Italian")}
  let!(:pasta) {Recipe.create!(name: 'Pasta', complexity: 3, genre: "Italian")}
  
  let!(:beef) {Ingredient.create!(name: 'Ground Beef', cost: 2)}
  let!(:salt) {Ingredient.create!(name: 'Salt', cost: 4)}
  let!(:pepper) {Ingredient.create!(name: 'Pepper', cost: 1)}

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe 'instance methods' do
    describe '#total_cost' do
      before :each do
        RecipeIngredient.create(recipe: lasagna, ingredient: beef)
        RecipeIngredient.create(recipe: lasagna, ingredient: salt)
        RecipeIngredient.create(recipe: pasta, ingredient: salt)
        RecipeIngredient.create(recipe: pasta, ingredient: pepper)
      end
      it 'returns total costs of ingredients in a recipe' do
        expect(lasagna.total_cost).to eq(6)
        expect(pasta.total_cost).to eq(5)
      end
    end
  end
end
