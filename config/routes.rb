Rails.application.routes.draw do
  root to: "lectures#index"
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :questions do
    collection do
      get :search
    end

    member do
      get :contract
      post :purchase
    end
  end

  resources :lectures do
    collection do
      get :search
    end

    member do
      get :contract
    end
  end

  resources :contracts, only: [:index] do
    collection do
      post :search
    end
    resource :reviews, only: [:new, :create]
    collection do
      resources :reviews, only: [:edit, :update]
    end
  end

  resources :chats, only: [:index, :show, :create] do
    collection do
      post :search
    end
    member do
      post :purchase
      post :change_contrarct_situation
    end
  end

end
