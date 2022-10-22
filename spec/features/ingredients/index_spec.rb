require 'rails_helper'

RSpec.describe "User Story 1" do
  describe "As a visitor" do
    describe "When I visit '/ingredients'" do
      it "I see a list of all ingredients including their name and cost" do
        ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
        ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)

        visit "/ingredients"
        # save_and_open_page
        expect(page).to have_content("Ground Beef: 2")
        expect(page).to have_content("Salt: 4")

      end
    end
  end
end
