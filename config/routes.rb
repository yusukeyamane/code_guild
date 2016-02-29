Rails.application.routes.draw do
  root to: "lectures#index"
  devise_for :users
  resources :quesitons
  resources :users, only: [:show, :edit, :update]
  resources :lectures, only: [:index, :new, :create, :show]
end
