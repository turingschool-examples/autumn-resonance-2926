require 'rails_helper'

RSpec.describe Recipe do
  before (:each) do
    @pasta = Recipe.create!(name: "Pasta", complexity: 2, genre: "Italian")
    @pizza = Recipe.create!(name: "Pizza", complexity: 2, genre: "Italian")
    
    @cheese = Ingredient.create!(name: "cheese", cost: 2)
    @sauce = Ingredient.create!(name: "sauce", cost: 4)
    @dough = Ingredient.create!(name: "dough", cost: 5)
    @penne =  Ingredient.create!(name: "penne", cost: 3)
    @garlic =  Ingredient.create!(name: "garlic", cost: 1)
    @bread =  Ingredient.create!(name: "bread", cost: 3)

    @pasta_dinner = Recipe_ingredient.create!(recipe_id: @pasta.id, ingredient_id: @penne.id  )
    @pasta_dinner = Recipe_ingredient.create!(recipe_id: @pasta.id, ingredient_id: @sauce.id  )
    @pasta_dinner = Recipe_ingredient.create!(recipe_id: @pasta.id, ingredient_id: @bread.id  )
    
    @pizza_dinner = Recipe_ingredient.create!(recipe_id: @pizza.id, ingredient_id: @dough.id  )
    @pizza_dinner = Recipe_ingredient.create!(recipe_id: @pizza.id, ingredient_id: @sauce.id  )
    @pizza_dinner = Recipe_ingredient.create!(recipe_id: @pizza.id, ingredient_id: @garlic.id  )
  end

  describe "story 2- '/recipes/:id'" do
    before(:each)do
      visit  ("/recipes/#{@pasta_dinner.id}")
    end

    it "displays recipe's name, complexity and genre" do
      require 'pry';binding.pry
      expect(page).to have_content(@pasta.name)
    
    end

    # it "list of the names of the ingredients for the recipe" do
    
    # end
  end

end