class RecipesController < ApplicationController
  def search
    session.delete(:query)
  end

  def index
    params[:search] ||= session[:query]
    session[:query] = params[:search]
    Recipe.reset
    @recipes, @page_data = Recipe.all(session[:query])
    session[:page] = 1
  end

  def show
    @recipe = EdamamWrapper.find(params[:id])
  end
end
