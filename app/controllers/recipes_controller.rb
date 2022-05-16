class RecipesController < ApplicationController
  # POST /recipes/search
  def search
    ingredients = params[:ingredients]

    @recipes = Recipe.search ingredients

    render json: @recipes
  end
end
