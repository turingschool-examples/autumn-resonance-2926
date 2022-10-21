class IngredientsController < ApplicationController
  def index
    @ings = Ingredient.alphabetize
  end
end