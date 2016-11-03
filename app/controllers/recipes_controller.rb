class RecipesController < ApplicationController
  def search; end

  def index
    @query = params[:search]
    session[:query] = @query
    @recipes = EdamamWrapper.all_results(@query)
  end

  def show
    @query = session[:query]

    begin
      @recipe = EdamamWrapper.find(params[:uri])
    rescue ActiveRecord::RecordNotFound
      render file: "#{Rails.root}/public/404.html", layout: false, status: not_found
    end
  end
end
