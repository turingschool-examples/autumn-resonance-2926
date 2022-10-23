require 'rails_helper'

RSpec.describe 'recipe show page' do 
  before(:each) do 
    @burger = Recipe.create!(name: 'Hamburger', complexity: 1, genre: 'American')
    @raw = Recipe.create!(name: 'Beef Tartare', complexity: 3, genre: 'French')
    @beef = Ingredient.create!(name: 'Ground Beef', cost: 2)
    @salt = Ingredient.create!(name: 'Salt', cost: 4)
    @egg = Ingredient.create!(name: 'Egg', cost: 2)

    @burger.ingredients << @beef << @salt
    @raw.ingredients << @beef
  end

  it 'lists recipe name and attributes' do 
    visit "/recipes/#{@burger.id}"

    expect(page).to have_content(@burger.name)
    expect(page).to_not have_content(@raw.name)
    expect(page).to have_content("Complexity: #{@burger.complexity}")
    expect(page).to have_content("Genre: #{@burger.genre}")
  end

  it 'lists recipes ingredients' do
    visit "/recipes/#{@burger.id}"

    expect(page).to have_content(@beef.name)
    expect(page).to have_content(@salt.name)

    visit "/recipes/#{@raw.id}"

    expect(page).to have_content(@beef.name)
    expect(page).to_not have_content(@salt.name)
  end

  it 'shows total cost of all ingredients in recipe' do 
    visit "/recipes/#{@burger.id}"

    expect(page).to have_content("Total Cost: 6")

    visit "/recipes/#{@raw.id}"

    expect(page).to have_content("Total Cost: 2")
  end

    #   Extension 2
    # Add an Ingredient to a Recipe

    # As a visitor
    # When I visit '/recipes/:id'
    # Then I see a form to add an ingredient to this recipe.
    # When I fill in a field with an existing ingredient's ID,
    # And I click submit,
    # Then I am redirrected to the recipe's show page,
    # And I see the new ingredient listed for this recipe.

  context 'adding ingredients' do
    it 'has a form to add ingredients' do
      visit "/recipes/#{@raw.id}"

      expect(page).to have_field('Ingredient Id')
      expect(page).to have_button('Add Ingredient')
    end

    it 'when submitted, adds ingredients to recipe show page' do
      visit "/recipes/#{@raw.id}"

      expect(page).to_not have_content(@egg.name)

      fill_in 'ingredient_id', with: @egg.id
      click_button 'Add Ingredient'

      expect(current_path).to eq("/recipes/#{@raw.id}")
      expect(page).to have_content(@egg.name)
    end
  end
end