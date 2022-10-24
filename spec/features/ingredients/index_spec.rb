require 'rails_helper' 

RSpec.describe 'ingredients index page', type: :feature do 
  describe 'as a visitor' do 
    describe 'when i visit /ingredients' do 
      before :each do 
        @cheese = Ingredient.create!(name: "Cheese", cost: 3)
        @salami = Ingredient.create!(name: "Salami", cost: 5)
        @olives = Ingredient.create!(name: "Black Olives", cost: 2)
        @onions = Ingredient.create!(name: "Onions", cost: 1)
        visit '/ingredients' 

      end
      it 'i see a list of all ingredients including name and cost' do 

        expect(page).to have_content("#{@cheese.name}")
        expect(page).to have_content("#{@cheese.cost}")
        expect(page).to have_content("#{@salami.name}")

      end

      it 'these ingredients are sorted alphabetically' do 
        cheese = Ingredient.create!(name: "Cheese", cost: 3)
        salami = Ingredient.create!(name: "Salami", cost: 5)
        broccoli = Ingredient.create!(name: "Broccoli", cost: 4)
        pizza = Recipe.create!(name: "Pizza", complexity: 4, genre: "Italian")
        RecipeIngredient.create!(ingredient: cheese, recipe: pizza)
        RecipeIngredient.create!(ingredient: salami, recipe: pizza)
        visit '/ingredients' 
        expect(page.text.index(cheese.name)).to be < page.text.index(salami.name)
        # expect("Name: Cheese Cost: 3").to appear_before("Name: Salami Cost: 5")
      end
    end
  end
end