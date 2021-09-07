Rails.application.routes.draw do
  devise_for :users

  resources :organizations, only: [:new, :create, :edit, :update, :show]
  resources :events, only: [:index, :show, :new, :create, :edit, :update]
  resource :event_categories, only: [:new, :create, :edit, :update]
  resources :orders, only: [:index, :show, :new, :create]
  resources :tickets, only: [:index, :show, :new, :create]
  resources :venues, only: [:index, :show]
  resources :clients, only: [:index, :show, :new, :create, :edit, :update]

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
