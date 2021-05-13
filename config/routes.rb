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

  get 'home/index'
  root to: 'home#index'
end
