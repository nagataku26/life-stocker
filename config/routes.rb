Rails.application.routes.draw do
  devise_for :users
  get 'lists/index'
  root to: "lists#index"
  resources :users do
    member do
      get "all_items"
      get "purchase_plan"
    end
  end

  resources :lists do
    resources :items, only: [:new, :create, :show]
  end
end