class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    require 'pry'; binding.pry
  end
  
end