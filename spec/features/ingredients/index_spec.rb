# As a visitor,
# When I visit '/ingredients'
# I see a list of all the ingredients including their name and cost
# (e.g. "Ground Beef: 2"
#      "Salt: 4")

require 'rails_helper'

RSpec.describe 'On the Ingredient Index Page' do
  describe 'When I visit /ingredients' do
    before(:each) do
      @carrots = Ingredient.create!(name: "Carrots", cost: 2)
      @onions = Ingredient.create!(name: "Onions", cost: 3)
      @cellery = Ingredient.create!(name: "Cellery", cost: 3)
    end
    describe 'Then I see' do
      it 'A list of ingredients with their name and cost' do
        visit "/ingredients"

        expect(page).to have_content("#{@carrots.name}: #{@carrots.cost}")
        expect(page).to have_content("#{@onions.name}: #{@onions.cost}")
        expect(page).to have_content("#{@cellery.name}: #{@cellery.cost}")
      end
    end
  end
end