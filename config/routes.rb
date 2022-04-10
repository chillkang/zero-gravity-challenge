Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show] do
    resources :donors, only: %i[new create edit update]
  end
end
