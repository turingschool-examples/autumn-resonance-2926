require 'rails_helper'

RSpec.describe Ingredient do 
  describe '#index' do 
    it 'shows list of ingredients and their cost' do 
      ingredient1 = Ingredient.create!(name: "Ground Beef:", cost: 2)
      ingredient2 = Ingredient.create!(name: "Pasta:", cost: 5)
      ingredient3 = Ingredient.create!(name: "Parmesan Cheese:", cost: 8)
      ingredient4 = Ingredient.create!(name: "Tomato Sauce:", cost: 3)
      visit '/ingredients'

      expect(page).to have_content("Ground Beef: 2")
      expect(page).to have_content("Pasta: 5")
      expect(page).to have_content("Parmesan Cheese: 8")
      expect(page).to have_content("Tomato Sauce: 3")
    end
  end
end