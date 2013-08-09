FinalProject::Application.routes.draw do

  root 'phrases#new'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :phrases, except: :destroy, shallow: true do
  	resources :translations do
  		resources :votes, only: [:create, :destroy]
	end


end
