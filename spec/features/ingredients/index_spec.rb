# As a visitor,
# When I visit '/ingredients'
# I see a list of all the ingredients including their name and cost
# (e.g. "Ground Beef: 2"
#      "Salt: 4")

require 'rails_helper'

RSpec.describe 'On the Ingredient Index Page' do
  before(:each) do
    @onions = Ingredient.create!(name: "Onions", cost: 3)
    @cellery = Ingredient.create!(name: "Cellery", cost: 3)
    @carrots = Ingredient.create!(name: "Carrots", cost: 2)
  end
  describe 'When I visit /ingredients' do
    describe 'Then I see' do
      it 'a list of ingredients with their name and cost' do
        visit "/ingredients"

        expect(page).to have_content("#{@carrots.name}: #{@carrots.cost}")
        expect(page).to have_content("#{@onions.name}: #{@onions.cost}")
        expect(page).to have_content("#{@cellery.name}: #{@cellery.cost}")
      end

      it 'ingredients listed alphabetically' do
        visit "/ingredients"

        expect(@carrots.name).to appear_before(@cellery.name)
        expect(@cellery.name).to appear_before(@onions.name)
      end
    end
  end
end