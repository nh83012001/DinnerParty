Rails.application.routes.draw do
  # resources :invites
  # resources :dinners
  # resources :courses
  resources :recipes
  resources :users

  get 'users/:id/new', to: 'users#newrecipe', as: 'new_user_recipe'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
