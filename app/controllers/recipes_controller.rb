class RecipesController < ApplicationController
  def search; end

  def index
    @query = params[:search]
    session[:query] = @query
    @recipes = Recipe.all(@query)
  end

  def show
    @query = session[:query]
    @recipe = EdamamWrapper.find(params[:id])
  end
end
