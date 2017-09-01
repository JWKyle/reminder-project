Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resources :reminders
  resources :sessions, only: [:new, :create, :destroy]

  # post 'twilio/message' => 'twilio#message'

  root 'sessions#new'
end
