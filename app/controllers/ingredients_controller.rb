class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.order_alphabatically
  end
end