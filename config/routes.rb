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
    member do
      get :contract
    end
  end

  resources :contracts, only: [:index] do
    resource :reviews, only: [:new, :create]
    collection do
      resources :reviews, only: [:edit, :update]
    end
  end

  resources :chat, only: [:index]
  post 'post' => 'chat#post'

end
