Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  get 'pages/home'
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'authors#new'

  # Users routes
  resources :users

  # Posts routes
  resources :posts #, only: [:index, :show, :update, :destroy, :edit, :create]

  # Posts routes
  resources :comments

end
