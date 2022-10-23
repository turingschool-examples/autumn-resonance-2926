require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end
  
  before(:each) do 
    @burger = Recipe.create!(name: 'Hamburger', complexity: 1, genre: 'American')
    @beef = Ingredient.create!(name: 'Ground Beef', cost: 2)
    @salt = Ingredient.create!(name: 'Salt', cost: 4)

    @burger.ingredients << @beef
  end

  describe 'instance methods' do 
    describe '#total_cost' do 
      it 'returns total_cost of ingredients for recipe' do 
        expect(@burger.total_cost).to eq(2)

        @burger.ingredients << @salt

        expect(@burger.total_cost).to eq(6)
      end
    end

    describe '#add_ingredient' do
      it 'adds ingredient to recipe using ingredient id' do 
        @burger.add_ingredient(@salt.id)

        expect(@burger.ingredients).to eq([@beef, @salt])
      end
    end
  end
end
