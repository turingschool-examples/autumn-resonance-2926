require 'rails_helper'

RSpec.describe Ingredient do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'instance methods' do
    describe '#order_by_name' do
      it 'orders ingredients by name' do
        expect(Ingredient.order_by_name).to be_truthy
      end
    end
  end

end
