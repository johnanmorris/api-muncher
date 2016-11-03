class RecipesController < ApplicationController
  def search; end

  def index
    @query = params[:search]
    @recipes = Recipe.all(@query)
  end
end
