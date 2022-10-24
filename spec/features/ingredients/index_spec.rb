require 'rails_helper'

RSpec.describe "Index Page" do 
  before :each do 
    
    @ingr1 = Ingredient.create!(name: "Expired Milk", cost: 10)
    @ingr2 = Ingredient.create!(name: "Moldy Fruit", cost: 5)
    @ingr3 = Ingredient.create!(name: "Rancid Fish", cost: 20)
  end

  describe 'US-1 : List ingredients and attributes' do 
    it "When I visit /ingredients, I ee a list of all the ingredients including their name and cost" do 

      visit '/ingredients'

      expect(page).to have_content("#{@ingr1.name}")
      expect(page).to have_content("#{@ingr1.cost}")
      expect(page).to have_content("#{@ingr2.name}")
      expect(page).to have_content("#{@ingr2.cost}")
      expect(page).to have_content("#{@ingr3.name}")
      expect(page).to have_content("#{@ingr3.cost}")
      expect(page).to_not have_content("Recipes")
    end
  end
end