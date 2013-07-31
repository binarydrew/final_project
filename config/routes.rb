FinalProject::Application.routes.draw do

  root to: 'static_pages#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
