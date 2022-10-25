require 'rails_helper'

RSpec.describe 'ingredients index' do
  before :each do
    @ingredient1 = Ingredient.create!(name: 'Oreos', cost: 2)
    @ingredient2 = Ingredient.create!(name: 'Reeses', cost: 1)
  end
  describe 'when I visit /ingredients' do
    it 'sees a list of all ingredients with their name and cost' do
      visit '/ingredients'

      expect(current_path).to eq('/ingredients')
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient1.cost)
      expect(page).to have_content(@ingredient2.name)
      expect(page).to have_content(@ingredient2.cost)
    end
  end
end
