Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"

  resources :users, only: [:show] do
    resources :donors, only: %i[new create edit update]
    resources :scholars, only: %i[new create edit update]
  end
end
