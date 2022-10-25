require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  it "can add total cost" do
    ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
    expect(Ingredient.total_cost).to eq(6)
  end
end
