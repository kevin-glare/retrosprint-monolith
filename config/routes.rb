# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :teams do
    resources :retros do
      resources :stickers, only: :update
    end
  end

  resources :messages, only: :create

  root 'pages#home'
end
