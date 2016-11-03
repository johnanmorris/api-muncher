class RecipesController < ApplicationController
  def search; end

  def index
    @query = params[:search]
    @recipes = Recipe.all
  end

  # def show
  #   @recipe = Recipe.find(params[:name])
  # end
end
