Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :organizations, except: [:destroy] do
    devise_scope :user do
      get "new_user_organization", to: "registrations#new_user_organization"
      post "create_new_user_organization", to: "registrations#create_new_user_organization"
    end
  end
  resources :events, except: :destroy do
    resources :orders, except: [:edit, :update, :destroy]
  end
  resource :event_categories, except: [:index, :show]
  resources :tickets, except: [:edit, :update, :destroy]
  resources :venues, only: [:index, :show]
  resources :clients, except: :destroy

  get "validation", to: "tickets#validation"

  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
