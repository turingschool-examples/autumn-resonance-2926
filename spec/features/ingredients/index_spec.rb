require 'rails_helper' 

RSpec.describe 'ingredients index page', type: :feature do 
  describe 'as a visitor' do 
    describe 'when i visit /ingredients' do 
      it 'i see a list of all ingredients including name and cost' do 
        cheese = Ingredient.create!(name: "Cheese", cost: 3)
        salami = Ingredient.create!(name: "Salami", cost: 5)
        visit '/ingredients' 
        expect(page).to have_content("#{cheese.name}")
        expect(page).to have_content("#{cheese.cost}")
        expect(page).to have_content("#{salami.name}")

      end
    end
  end
end