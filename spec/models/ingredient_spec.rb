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

  before(:each) do
    @beef = Ingredient.create!(name: 'Ground Beef', cost: 2)
    @salt = Ingredient.create!(name: 'Salt', cost: 4)
    @lettuce = Ingredient.create!(name: 'Lettuce', cost: 1)
  end

  describe 'class methods' do 
    describe '#order_by_name' do 
      it 'orders all ingredients by name alphabetically' do
        expect(Ingredient.order_by_name).to eq([@beef, @lettuce, @salt])
      end
    end
  end
end
