Rails.application.routes.draw do
  resources :reminders

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :reminders

  post 'twilio/message' => 'twilio#message'

  root 'sessions#new'
end
