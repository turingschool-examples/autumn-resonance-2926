class RecipesController < ApplicationController
  def show
    @reciepe = Recipe.find(params[:id])
  end
end
