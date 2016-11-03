Rails.application.routes.draw do
  # root 'home#index'

  get "recipes", to: "recipes#index"
  get "recipes/*id", to: "recipes#show", format: false, as: "recipe"
  get "search", to: "recipes#search", as: "search"
end
