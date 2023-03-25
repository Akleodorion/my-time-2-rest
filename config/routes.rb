Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "offers#index"
  resources :offers
  resources :diplomas, only: %i[create destroy]
  resources :experiences, only: %i[create destroy]
  resources :reviews, only: %i[create destroy]
  resources :appliances, only: %i[create destroy]
  resources :participants, only: %i[create destroy]
  resources :chatrooms, only: %i[create destroy]
  resources :messages, only: %i[create]
end
