require 'rails_helper'

RSpec.describe 'the recipe show' do
  it "displays the recipe's name, complexity, and genre" do
    pasta = Recipe.create(name: "Pasta", complexity: 2, genre: "Italian")

    visit "/recipes/#{pasta.id}"

    expect(page).to have_content(pasta.name)
    expect(page).to have_content(pasta.complexity)
    expect(page).to have_content(pasta.genre)
  end
  it "displays a list of the names of the ingredients for the recipe" do
    pasta = Recipe.create(name: "Pasta", complexity: 2, genre: "Italian")
    salt = pasta.ingredients.create(name: "Salt", cost: 4)
    flour = pasta.ingredients.create(name: "Flour", cost: 3)

    visit "/recipes/#{pasta.id}"

    expect(page).to have_content(salt.name)
    expect(page).to have_content(flour.name)
    save_and_open_page
  end
end
