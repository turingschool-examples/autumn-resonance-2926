require 'rails_helper'

RSpec.describe 'recipe show page - /recipes/:id/show.html.erb', type: :feature do
  describe 'as a user' do
    describe 'when I visit the recipe show page' do
      it '- shows the recipes name, complexity, and genre. I also see a list of the names of the ingredients for the recipe' do
        ground_beef = Ingredient.create!(name: "Ground Beef", cost: 2)
        salt = Ingredient.create!(name: "Salt", cost: 4)
        pasta = Ingredient.create!(name: "Pasta", cost: 3)
        tomato_paste = Ingredient.create!(name: "Tomato Paste", cost: 2)
        butter = Ingredient.create!(name: "Butter", cost: 5)
        chicken = Ingredient.create!(name: "Chicken", cost: 10)
        orzo = Ingredient.create!(name: "Orzo", cost: 3)
        feta = Ingredient.create!(name: "Feta Cheese", cost: 7)

        spaghetti = Recipe.create!(name: "Spaghetti", complexity: 1, genre: "Italian")
        chicken_orzo = Recipe.create!(name: "Chicken Orzo", complexity: 3, genre: "Greek")

        visit "/recipes/#{spaghetti.id}"

        expect(page).to have_content(spaghetti.name)
        expect(page).to have_content(spaghetti.complexity)
        expect(page).to have_content(spaghetti.genre)
        expect(page).to have_content(ground_beef.name)
        expect(page).to have_content(salt.name)
        expect(page).to have_content(pasta.name)
        expect(page).to have_content(tomato_paste.name)
        expect(page).to have_content(butter.name)
        expect(page).to_not have_content(chicken_orzo.name)
        expect(page).to_not have_content(chicken_orzo.complexity)
        expect(page).to_not have_content(chicken_orzo.genre)
        expect(page).to_not have_content(chicken.name)
        expect(page).to_not have_content(orzo.name)
      end
    end
  end
end