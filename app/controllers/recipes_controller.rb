class RecipesController < ApplicationController
  def search; end

  def index
    @query = params[:search]
    session[:query] = @query
    @recipes = Recipe.all(session[:query])
  end

  def show
    @query = session[:query]
    @recipe = EdamamWrapper.find(params[:id])
    # raise
  end
end
