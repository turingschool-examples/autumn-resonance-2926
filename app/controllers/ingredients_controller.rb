class IngredientsController < ApplicationController
  def index
    @ings = Ingredient.all
  end
end