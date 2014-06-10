Rails.application.routes.draw do
  root "customers#index"

  resources :customers do
    resources :payments, only: :create
  end
end
