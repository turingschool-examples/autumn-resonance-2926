require 'rails_helper'

RSpec.describe '/ingredients/index.html.erb', type: :feature do 
  describe 'as a user' do
    describe 'when I visit the ingredients index page' do
      it '- I see a list of all the ingredients including their name and cost' do
        ground_beef = Ingredient.create!(name: "Ground Beef", cost: 2)
        salt = Ingredient.create!(name: "Salt", cost: 4)
        pasta = Ingredient.create!(name: "Pasta", cost: 3)
        tomato_paste = Ingredient.create!(name: "Tomato Paste", cost: 2)
        butter = Ingredient.create!(name: "Butter", cost: 5)
        chicken = Ingredient.create!(name: "Chicken", cost: 10)
        orzo = Ingredient.create!(name: "Orzo", cost: 3)
        feta = Ingredient.create!(name: "Feta Cheese", cost: 7)

        visit '/ingredients'

        expect(page).to have_content(ground_beef.name)
        expect(page).to have_content(ground_beef.cost)
        expect(page).to have_content(salt.name)
        expect(page).to have_content(salt.cost)
        expect(page).to have_content(pasta.name)
        expect(page).to have_content(pasta.cost)
        expect(page).to have_content(tomato_paste.name)
        expect(page).to have_content(tomato_paste.cost)
        expect(page).to have_content(butter.name)
        expect(page).to have_content(butter.cost)
        expect(page).to have_content(chicken.name)
        expect(page).to have_content(chicken.cost)
        expect(page).to have_content(orzo.name)
        expect(page).to have_content(orzo.cost)
        expect(page).to have_content(feta.name)
        expect(page).to have_content(feta.cost)
      end

      it '- shows all of the ingredient names in alphabetical order' do
        ground_beef = Ingredient.create!(name: "Ground Beef", cost: 2)
        salt = Ingredient.create!(name: "Salt", cost: 4)
        pasta = Ingredient.create!(name: "Pasta", cost: 3)
        tomato_paste = Ingredient.create!(name: "Tomato Paste", cost: 2)
        butter = Ingredient.create!(name: "Butter", cost: 5)
        chicken = Ingredient.create!(name: "Chicken", cost: 10)
        orzo = Ingredient.create!(name: "Orzo", cost: 3)
        feta = Ingredient.create!(name: "Feta Cheese", cost: 7)

        visit '/ingredients'

        expect(butter.name).to appear_before(chicken.name)
        expect(chicken.name).to appear_before(feta.name)
        expect(feta.name).to appear_before(ground_beef.name)
        expect(ground_beef.name).to appear_before(orzo.name)
        expect(orzo.name).to appear_before(pasta.name)
        expect(pasta.name).to appear_before(salt.name)
        expect(salt.name).to appear_before(tomato_paste.name)
      end
    end
  end
end