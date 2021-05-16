# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users

  resources :tweets, only: :create
  resources :users, only: :show do
    member do
      post 'follow'
      post 'unfollow'
    end
  end

  get '/global', to: 'home#global'

  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  root to: 'home#global'
end
