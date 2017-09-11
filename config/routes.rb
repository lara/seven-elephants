Rails.application.routes.draw do
  namespace :admin do
    resources :orders
    resources :products

    root to: "orders#index"
  end

  root "products#index"

  resources :products, only: %i[index show]
end
