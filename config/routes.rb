Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  authenticated :user do
    root 'home#index', as: 'authenticated_root'
  end

  devise_scope :user do
    root 'devise/sessions#new'
  end

  resources :users

  resources :friends
  resources :restaurants

  resources :notifications

  resources :groups do
    resources :group_friends
  end
  
  mount ActionCable.server => '/cable'
  
  resources :orders do
    resources :items
    resources :order_friends
    member do
      patch :change_status_to_completed
      patch  :change_status_to_canceled
    end
    
    # resources :order_friends
    collection do
      get 'addFriendtoOrder'
    end
    collection do
      get 'addGrouptoOrder'
    end
    collection do
      get 'order_friend_params'
    end
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
