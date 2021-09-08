Rails.application.routes.draw do
  get 'clients/new'
  get 'clients/create'
  get 'clients/index'
  get 'clients/show'
  get 'clients/edit'
  get 'clients/update'
  get 'tickets/show'
  get 'tickets/index'
  get 'tickets/new'
  get 'tickets/create'
  get 'orders/new'
  get 'orders/create'
  get 'orders/edit'
  get 'orders/update'
  devise_for :users

  resources :organizations, except: [:index, :destroy]
  resources :events, except: :destroy
  resource :event_categories, except: [:index, :show, :destroy]
  resources :orders, except: [:edit, :update, :destroy]
  resources :tickets, except: [:edit, :update, :destroy]
  resources :venues, only: [:index, :show]
  resources :clients, except: :destroy

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
