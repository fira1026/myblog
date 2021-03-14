Rails.application.routes.draw do
root 'pages#index'
get 'about', to: 'pages#about'
get 'signup', to: 'authors#new'
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
post 'logout', to: 'sessions#destroy'
get 'logout', to: 'sessions#destroy'

resources :authors, except: [:new]
resources :posts #, only: [:index, :show, :update, :destroy, :edit, :create]
end
