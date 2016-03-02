Rails.application.routes.draw do
  root to: "lectures#index"
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :questions do
    member do
      get :contract
    end
  end

  resources :lectures do
    colection do
      resources :reviews, only: [:show, :create]
    end
    member do
      get :contract
    end
  end
  resources :contracts, only: [:index]
end
