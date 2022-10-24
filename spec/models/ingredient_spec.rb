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

  describe 'class methods' do 
    describe 'sort_alphabetically' do 
      it 'sorts the collection of ingredients alphabetically by name' do 
        marshmallow = Ingredient.create!(name: "Marshmallows", cost: 4)
        chocolate = Ingredient.create!(name: "Chocolate Bar", cost: 2)
        graham_cracker = Ingredient.create!(name: "Graham Crackers", cost: 3)

        expect(Ingredient.sort_alphabetically).to eq([chocolate, graham_cracker, marshmallow])
      end
    end
  end
end
