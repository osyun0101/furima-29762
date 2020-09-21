Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products do
    resources :orders, only: [:index, :create]
  end
  resources :card, only: [:new, :create]
end
