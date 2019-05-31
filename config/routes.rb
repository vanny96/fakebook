Rails.application.routes.draw do
  devise_scope :user do
    root to: "posts#index"
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, except: [:new, :create, :edit, :update] 
  get 'users/:id/friends', to: 'users#show_friends', as: 'show_user_friends'
  put 'users/:id/add_photo', to: 'users#add_photo', as: 'add_photo'

  resources :friend_pending_requests, only: [:create, :destroy]
  resources :friendships , only: [:create, :destroy]

  resources :posts, only: [:index]

  resources :text_posts, only: [:show, :create, :destroy, :edit, :update]

  resources :user_like_posts, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end
