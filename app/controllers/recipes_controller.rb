class RecipesController < ApplicationController
  def search
    session.delete(:query)
  end

  def index
    params[:search] ||= session[:query]
    session[:query] = params[:search]
    Recipe.reset
    @recipes = Recipe.all(session[:query])
  end

  def show
    @recipe = EdamamWrapper.find(params[:id])
  end
end
