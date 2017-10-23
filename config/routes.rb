Rails.application.routes.draw do
  resources :invites
  resources :dinners
  resources :courses
  resources :recipes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
