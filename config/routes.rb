
Rails.application.routes.draw do
  root 'pictures#index'

  devise_for :users

  resources :pictures do
    resources :comments, only: [:create]
  end

  resources :users, only: [:show]
end

