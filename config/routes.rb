Rails.application.routes.draw do
  # root 'home#index'
  resources :recipes, only: [:index, :show]

  get "search", to: "recipes#search", as: "search"
end
