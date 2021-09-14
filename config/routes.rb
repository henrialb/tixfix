Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :organizations, except: [:destroy]
  resources :events, except: :destroy do
    resources :orders, except: [:edit, :update, :destroy]
  end
  resource :event_categories, except: [:index, :show]
  resources :tickets, except: [:edit, :update, :destroy] do
    resources :downloads, only: [:show]
  end
  resources :venues, only: [:index, :show]
  resources :clients, except: :destroy

  get "validation", to: "tickets#validation"

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
