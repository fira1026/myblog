Rails.application.routes.draw do
root 'pages#index'
get 'about', to: 'pages#about'
get 'signup', to: 'authors#new'

# Sessions routes
get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
post 'logout', to: 'sessions#destroy'
get 'logout', to: 'sessions#destroy'

# Authors routes
resources :authors, except: [:new]

# Posts routes
resources :posts #, only: [:index, :show, :update, :destroy, :edit, :create]
end
