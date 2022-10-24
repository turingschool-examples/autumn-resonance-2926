require "rails_helper"

RSpec.describe "Ingredients index page" do 
  describe "As a visitor" do 
    describe "When I visit /ingredients" do 
      it "displays a list of all ingredients including their name and cost" do 
        beef = Ingredient.create!(name: "Ground Beef", cost: 3)
        cheese = Ingredient.create!(name: "Pecorino Cheese", cost: 10)
        visit "/ingredients"

        within "#ingredient-#{beef.id}" do 
          expect(page).to have_content("Ground Beef: 3")
        end

        within "#ingredient-#{cheese.id}" do 
          expect(page).to have_content("Pecorino Cheese: 10")
        end
      end

      it "displays the ingredients sorted alphabetically by name" do 
        cheese = Ingredient.create!(name: "Pecorino Cheese", cost: 10)
        pasta = Ingredient.create!(name: "Rigatoni Pasta", cost: 2)
        avocado = Ingredient.create!(name: "Avocados", cost: 12)

        visit "/ingredients"

        expect("Avocados").to appear_before("Pecorino Cheese")
        expect("Pecorino Cheese").to appear_before("Rigatoni Pasta")\
      end
    end
  end
end