Rails.application.routes.draw do
  devise_scope :user do
    root to: "posts#index"
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, except: [:new, :create, :edit, :update] do 
    member do
      post 'users/:id/profile_pictures', to: 'profile_pictures#create', as: 'add_profile_pictures'
      patch 'users/:id/profile_pictures', to: 'profile_pictures#update', as: 'update_profile_pictures'
      delete 'users/:id/profile_pictures', to: 'profile_pictures#destroy', as: 'destroy_profile_pictures'
    end 
  end
  get 'users/:id/friends', to: 'users#show_friends', as: 'show_user_friends'

  resources :friend_pending_requests, only: [:create, :destroy]
  resources :friendships , only: [:create, :destroy]

  resources :posts, only: [:index]

  resources :text_posts, only: [:show, :create, :destroy, :edit, :update]
  resources :image_posts, only: [:show, :new, :create, :destroy, :edit, :update]

  resources :user_like_posts, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end
