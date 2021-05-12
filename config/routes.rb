# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :tweets, only: :create

  get 'home/index'

  devise_for :users
  
  root to: 'home#index'
end
