Rails.application.routes.draw do
  devise_for :users
  get 'lists/index'
  root to: "lists#index"
  resources :users, only: :show
  resources :lists, only: [:index, :new, :create, :show, :edit] do
    resources :items, only: [:new, :create]
  end
end