require 'rails_helper'

RSpec.describe "Recipe Show Page" do
  before :each do 

    @recipe1= Recipe.create!(name: "Gorden Ramsey's 5 Star Fish", complexity: 9, genre: "Seafood")
    @recipe2= Recipe.create!(name: "Exclusive Dessert", complexity: 5, genre: "Dessert")
    @ingr1 = @recipe2.ingredients.create!(name: "Expired Milk", cost: 10)
    @ingr2 = @recipe2.ingredients.create!(name: "Moldy Fruit", cost: 5)
    @ingr3 = @recipe1.ingredients.create!(name: "Rancid Fish", cost: 20)
    @ingr4 = @recipe1.ingredients.create!(name: "Bar Matt Tequila", cost: 100)
    
  end

  describe "US-2: Listing ingredients in recipes on their show page" do 
    xit " WhenI visit a recipe show page, I see recipe's name, complexity and genre." do 

      visit "/recipes/#{@recipe1.id}"

      expect(page).to have_content("#{@recipe1.name}")
      expect(page).to have_content("#{@recipe1.complexity}")
      expect(page).to have_content("#{@recipe1.genre}")

      expect(page).to_not have_content("#{@recipe2.name}")
    end

    xit 'On recipe show page, I see list of ingredient names for that particular recipe' do 
      visit "/recipes/#{@recipe1.id}"

      expect(page).to have_content("#{ingr3.name}")
      expect(page).to have_content("#{ingr4.name}")
      expect(page).to_not have_content("#{ingr1.name}")
      expect(page).to_not have_content("#{ingr2.name}")
    end
  end

  describe "US-3 Active Record: Total cosst of ingredients for recipe" do 
    xit 'On recipe show page, I see the total cost of all ingredients in the recipe' do 
      visit "/recipes/#{@recipe1.id}"

      expect(page).to have_content("Total Cost: 120")
      expect(page).to_not have_content("Total Cost: 15")
    end
  end
end