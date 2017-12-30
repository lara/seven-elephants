Rails.application.routes.draw do
  namespace :admin do
    resources :orders do
      post :ship
      post :cancel
    end
    resources :products

    root to: "orders#index"
  end

  root "products#index"

  get :cart, to: "orders#current"
  get :checkout, to: "orders#checkout"
  resources :order_products, only: %i[create update destroy]
  resources :products, only: %i[index show]
  resources :charges
end
