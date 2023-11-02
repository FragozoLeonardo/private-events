# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'up' => 'rails/health#show', as: :rails_health_check

  root "users#index"

  resources :events
end
