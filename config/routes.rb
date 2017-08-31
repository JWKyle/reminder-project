Rails.application.routes.draw do
  resources :reminders
  # root to: 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :reminders

  root 'sessions#new'
end
