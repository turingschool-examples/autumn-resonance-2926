class RecipesController  < ApplicationController

  def show
    # require 'pry';binding.pry
    @recipe = Recipe.find(params[:id])
  end
end