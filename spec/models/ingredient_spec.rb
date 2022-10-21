require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let!(:pepper) {Ingredient.create!(name: 'Pepper', cost: 1)}
  let!(:beef) {Ingredient.create!(name: 'Ground Beef', cost: 2)}
  let!(:tomato) {Ingredient.create!(name: 'Tomato', cost: 3)}
  let!(:salt) {Ingredient.create!(name: 'Salt', cost: 4)}
  
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'class methods' do
    describe '#alphabetize' do
      it 'returns a list of all ingredients in alphabetical order' do
        expect(Ingredient.alphabetize).to eq([beef, pepper, salt, tomato])
      end
    end
  end
end
