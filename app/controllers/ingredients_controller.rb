class IngredientsController < ApplicationController
    def index
        @Ingredients = Ingredient.all
    end
end