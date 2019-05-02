Rails.application.routes.draw do
  
  root 'gossips#index'
  resources :gossips
  resources :users
  resources :cities, only: [:index, :show]
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]
  resources :likes, only: [:show, :new, :create, :destroy]

  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get 'welcome/:user_entry', to: 'dynamic#welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
