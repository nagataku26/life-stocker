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
    collection do
      get "join"
      post "join_list"
    end
    resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
  end
end