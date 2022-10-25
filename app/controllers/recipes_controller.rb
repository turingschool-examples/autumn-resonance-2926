class RecipesController < ApplicationController
  def show
    @reciepe = Recipe.find(params[:id])
    @ingredients = @reciepe.ingredients
  end
end
