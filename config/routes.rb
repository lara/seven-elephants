Rails.application.routes.draw do
  namespace :admin do
    resources :orders
    resources :products

    root to: "orders#index"
  end

  root "products#index"

  get :cart, to: "orders#current"
  resources :order_products, only: %i[create update destroy]
  resources :products, only: %i[index show]
end
