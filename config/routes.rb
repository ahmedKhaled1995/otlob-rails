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

  resources :groups do
    resources :group_friends
  end
  
  resources :orders do
    resources :items
    resources :order_friends
    collection do
      get 'test'
    end
  end


  # post 'order/download' => 'order#download', as: :download
  # post 'order/show_options' => 'orders#show_options', as: :show_options

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
