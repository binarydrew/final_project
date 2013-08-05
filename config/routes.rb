FinalProject::Application.routes.draw do

  root 'phrases#new'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :phrases, except: :destroy
  resources :translations
end
