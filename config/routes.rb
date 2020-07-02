Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "site#homepage"
  resources :users, only: [:new, :create, :show, :edit, :destroy]
  resources :books
  resources :authors, only: [:index, :show]
end
