Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products, only: [:new, :create,:show] do
    resources :orders, only: :index
  end
end
