Rails.application.routes.draw do
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
