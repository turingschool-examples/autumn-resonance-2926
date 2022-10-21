require 'rails_helper'

RSpec.describe 'ingredients index' do
  describe 'As a visitor' do
    it "I see a list of all the ingredients including their name and cost" do
      sauce = Ingredient.create!(name:'Sauce', cost:5)
      peppperoni = Ingredient.create!(name:'Peppperoni', cost:8)
      dough = Ingredient.create!(name:'Dough', cost:2)
      
      visit '/ingredients'
      
      expect(page).to have_content("#{sauce.name}: #{sauce.cost}")
      expect(page).to have_content("#{peppperoni.name}: #{peppperoni.cost}")
      expect(page).to have_content("#{dough.name}: #{dough.cost}")
    end
  end
end