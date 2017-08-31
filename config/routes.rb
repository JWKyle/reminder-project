Rails.application.routes.draw do
  # root to:
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show]
  resources :reminders
  resources :sessions, only: [:new, :create, :destroy]

  root 'sessions#new'
end
