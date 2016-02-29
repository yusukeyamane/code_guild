Rails.application.routes.draw do
  root to: "lectures#index"
  devise_for :users
  resources :quesitons
  resources :lectures, only: [:index, :new, :create]
  resources :users, only: [:show, :edit, :update]
end
