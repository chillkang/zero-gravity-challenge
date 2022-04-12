Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"

  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :users, only: [:index, :show] do
    resources :donors, only: %i[new create edit update]
    resources :scholars, only: %i[new create edit update]
  end

  resources :donors, only: %i[index show edit update] do
    resources :transactions, only: %i[new create]
  end

  resources :scholars, only: %i[index show edit update] do
    resources :transactions, only: %i[new create]
  end

  get '/my_payment', to: 'donors#dashboard'
  get '/my_payment', to: 'scholars#dashboard'
  resources :transactions, only: [:index, :show, :new, :create, :update, :destroy]
end
