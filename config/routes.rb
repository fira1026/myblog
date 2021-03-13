Rails.application.routes.draw do
root 'pages#index'
get 'about', to: 'pages#about'
resources :authors

resources :posts #, only: [:index, :show, :update, :destroy, :edit, :create]
end
