Rails.application.routes.draw do
root 'pages#index'
get 'about', to: 'pages#about'
get 'signup', to: 'authors#new'

resources :authors, except: [:new]
resources :posts #, only: [:index, :show, :update, :destroy, :edit, :create]
end
