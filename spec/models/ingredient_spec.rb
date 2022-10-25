require "rails_helper"


RSpec.describe(Ingredient, type: :model) do
  describe("validations") do
    it { should(validate_presence_of(:name)) }
    it { should(validate_presence_of(:cost)) }
  end

  describe("relationships") do
    it { should(have_many(:recipe_ingredients)) }
    it { should(have_many(:recipes).through(:recipe_ingredients)) }
  end

  describe("total_cost method") do
    before(:each) do
      @reciepe1 = Recipe.create!(      name: "Pasta",       complexity: 2,       genre: "Italian")
      @ing1 = Ingredient.create!(      name: "Salt",       cost: 4)
      @ing2 = Ingredient.create!(      name: "Pepper",       cost: 6)
      @ing3 = Ingredient.create!(      name: "Ground Beef",       cost: 10)
      @ing_rec1 = RecipeIngredient.create!(      ingredient_id: @ing1.id,       recipe_id: @reciepe1.id)
      @ing_rec2 = RecipeIngredient.create!(      ingredient_id: @ing2.id,       recipe_id: @reciepe1.id)
      @ing_rec3 = RecipeIngredient.create!(      ingredient_id: @ing3.id,       recipe_id: @reciepe1.id)
    end

    it("can add total cost of recipe") do
      expect(Ingredient.total_cost).to(eq(20))
    end
  end
end
