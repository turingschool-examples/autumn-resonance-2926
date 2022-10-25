require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cost }
  end

  describe 'relationships' do
    it { should have_many :recipe_ingredients }
    it { should have_many(:recipes).through(:recipe_ingredients) }
  end

  it 'can sort alphabetically' do
    ingredient1 = Ingredient.create!(name: 'Oreos', cost: 2)
    ingredient2 = Ingredient.create!(name: 'Reeses', cost: 1)
    ingredient3 = Ingredient.create!(name: 'Vanilla Ice Cream', cost: 4)
    ingredient4 = Ingredient.create!(name: 'Apples', cost: 1)

    expect(Ingredient.sorted_alphabetically).to eq([ingredient4, ingredient1, ingredient2, ingredient3])
  end
end
