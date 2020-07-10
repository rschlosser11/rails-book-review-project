Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "site#homepage"
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :books, only: [:new, :create, :show, :edit, :update, :index] do
    resources :reviews, only: [:new]
  end
  resources :authors, only: [:index, :show] do
    resources :books, only: [:show]
  end
  resources :reviews do
    resources :comments, only: [:create]
  end
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/auth/facebook/callback", to: "sessions#create_from_omni"
end
