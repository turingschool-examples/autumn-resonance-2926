require 'rails_helper'

RSpec.describe Recipe do 
  describe '#show' do 
    it 'shows the name, complexity, and genre of the recipe' do 
      recipe1 = Recipe.create!(name: "Spaghetti", complexity: 4, genre: "Italian")
      ingredient1 = Ingredient.create!(name: "Ground Beef:", cost: 2)
      ingredient2 = Ingredient.create!(name: "Pasta:", cost: 5)
      ingredient3 = Ingredient.create!(name: "Parmesan Cheese:", cost: 8)
      ingredient4 = Ingredient.create!(name: "Tomato Sauce:", cost: 3)
      visit "/recipes/#{recipe1.id}"


      expect(page).to have_content(recipe1.name)
      expect(page).to have_content(recipe1.complexity)
      expect(page).to have_content(recipe1.genre)
      
    end
  end

  describe '#total cost' do 
    it 'shows the total cost of all of the ingredients in the recipe' do 
      recipe1 = Recipe.create!(name: "Spaghetti", complexity: 4, genre: "Italian")
      ingredient1 = Ingredient.create!(name: "Ground Beef:", cost: 2)
      ingredient2 = Ingredient.create!(name: "Pasta:", cost: 5)
      ingredient3 = Ingredient.create!(name: "Parmesan Cheese:", cost: 8)
      ingredient4 = Ingredient.create!(name: "Tomato Sauce:", cost: 3)
      visit "/recipes/#{recipe1.id}"

      expect(page).to have_content("Total Cost: 18")

    end
  end
end