require 'rails_helper'

RSpec.describe Ingredient do
  before(:each)do
  @pasta = Recipe.create!(name: "Pasta", complexity: 2, genre: "Italian")
  @pizza = Recipe.create!(name: "Pizza", complexity: 2, genre: "Italian")
  
   @cheese = Ingredient.create!(name: "cheese", cost: 2)
   @sauce = Ingredient.create!(name: "sauce", cost: 4)
   @dough = Ingredient.create!(name: "dough", cost: 5)
   @penne =  Ingredient.create!(name: "penne", cost: 3)
   @garlic =  Ingredient.create!(name: "garlic", cost: 1)

  #  recipe_ingredient.create!()
  end

  describe "Story 1-'/ingredients'" do
    before(:each) do
    visit ('/ingredients')
    end

    it "should display all the ingredients name" do
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@garlic.name)
      expect(page).not_to have_content(@pizza.name)   
    end

    it "should display the price of each ingredient" do
      # save_and_open_page
      expect(page).to have_content("Ingredient cost 4")
      expect(page).not_to have_content("Ingredient cost 4.5")
    end

    it "Displays Ingredients Sorted Alphabetically"do
      expect(@cheese.name).to appear_before(@garlic.name)
      expect(@garlic.name).to appear_before(@pizza.name)   
    end
  end

end