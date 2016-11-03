Rails.application.routes.draw do
  # root 'home#index'
  resources :recipes, only: [:index]
  get "recipes/*id", to: "recipes#show", as: "recipe", format: false
  get "search", to: "recipes#search", as: "search"
end
