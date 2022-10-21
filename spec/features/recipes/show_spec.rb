require 'rails_helper'

RSpec.describe 'Recipe show' do
  
  before :each do
    @pizza = Recipe.create!(name:'Pizza', complexity:4, genre:'Italian')
    @sauce = Ingredient.create!(name:'Sauce', cost:5)
    @peppperoni = Ingredient.create!(name:'Peppperoni', cost:8)
    @dough = Ingredient.create!(name:'Dough', cost:2)
    
    @pizza.ingredients << @sauce
    @pizza.ingredients << @peppperoni
    @pizza.ingredients << @dough
  end
  describe 'as a visitor' do
    it "Then I see the recipe's name, complexity and genre, and I see a list of
    the names of the ingredients for the recipe" do
      visit "/recipes/#{@pizza.id}"
      
      expect(page).to have_content("Recipe: #{@pizza.name}")
      expect(page).to have_content("Complexity: #{@pizza.complexity}")
      expect(page).to have_content("Genre: #{@pizza.genre}")
      expect(page).to have_content("Ingredients:")
      expect(page).to have_content(@sauce.name)
      expect(page).to have_content(@peppperoni.name)
      expect(page).to have_content(@dough.name)
    end
    
    it "I see the total cost of all the ingredients in the recipe" do
      visit "/recipes/#{@pizza.id}"
      
      expect(page).to have_content("Total Cost: 15")
    end
  end
end