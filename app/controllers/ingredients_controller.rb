class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
    # require 'pry';binding.pry
  end
end