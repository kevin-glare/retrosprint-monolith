# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :teams do
    resources :retros
  end

  resources :messages, only: :create

  root 'pages#home'
end
