class RecipesController < ApplicationController
  resources :recipes, except: [:edit, :update, :destroy]

  # def index
  #   @all = EdamamWrapper.all_results(params[""])
  # end
end
