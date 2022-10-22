require 'rails_helper'

RSpec.describe "Index Page" do
  before :each do
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
    @ingredient_3 = Ingredient.create!(name: "Cheese", cost: 2)
  end
  describe "As a visitor" do
    describe "When I visit '/ingredients'" do
      it "I see a list of all ingredients including their name and cost" do
        visit "/ingredients"
        # save_and_open_page
        expect(page).to have_content("Ground Beef: 2")
        expect(page).to have_content("Salt: 4")
      end

      it "sorts ingredients alphabetically by name" do
        visit "/ingredients"
        # save_and_open_page
        expect("Cheese").to appear_before("Ground Beef")
        expect("Ground Beef").to appear_before("Salt")
      end
    end
  end
end
