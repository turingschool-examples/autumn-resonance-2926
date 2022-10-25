class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all.order(:name) # Should this be a class method inside
  end                                          # the ingredients model?
  
end