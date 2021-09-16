Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  # devise_scope :user do
  #   post "change_validation", to: "registrations#change_validation"
  # end

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
  resources :clients, except: [:destroy, :new]

  get "validation", to: "tickets#validation"
  post "change_validation", to: "pages#change_validation"
  get "print_all/:id", to: "orders#print_all", as: :print_all
  get "clients/new/:order_id", to: "clients#new", as: :new_client
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
