Rails.application.routes.draw do
  devise_scope :user do
    root to: "users#show"
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, except: [:new, :create, :edit, :update] 
end
