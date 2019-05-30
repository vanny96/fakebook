Rails.application.routes.draw do
  devise_scope :user do
    root to: "users#index"
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, except: [:new, :create, :edit, :update] 
  get 'users/:id/friends', to: 'users#show_friends', as: 'show_user_friends'

  resources :friend_pending_requests, only: [:create, :destroy]
  resources :friendships , only: [:create, :destroy]
  resources :friend_pending_requests , only: [:create, :destroy]
end
