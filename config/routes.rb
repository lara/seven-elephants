Rails.application.routes.draw do
  namespace :admin do
    resources :orders
    resources :order_products
    resources :products

    root to: "orders#index"
  end

  root "products#index"

  resources :products
end
