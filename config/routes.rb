Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  authenticated :user do
    root 'home#index', as: 'authenticated_root'
  end

  devise_scope :user do
    root 'devise/sessions#new'
  end

  resources :users do
    resources :notification_beta
  end

  resources :friends

  resources :groups do
    resources :group_friends
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
