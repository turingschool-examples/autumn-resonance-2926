class IngredientsController < ApplicationController
  def index 
    @ingredients = Ingredient.all.alphabetical 
  end
end