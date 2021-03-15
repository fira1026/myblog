Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'authors#new'

  # Sessions routes
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # post 'logout', to: 'sessions#destroy'
  # get 'logout', to: 'sessions#destroy'

  # get 'login', to: 'pages#aboutw'
  # post 'login', to: 'pages#about'
  # post 'logout', to: 'pages#about'
  # get 'logout', to: 'pages#about'

  # Users routes
  resources :users

  # Posts routes
  resources :posts #, only: [:index, :show, :update, :destroy, :edit, :create]

  # Posts routes
  resources :comments
end
