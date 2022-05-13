Rails.application.routes.draw do
  post 'recipes/search', to: 'recipes#search'
  resources :recipes
end
