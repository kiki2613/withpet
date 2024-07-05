Rails.application.routes.draw do
  root to: 'shops#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"
  
  resources :shops, only: [:index, :show] do
    resource  :favorites, only: [:create, :destroy, :index]
    resources :reviews,   only:  [:create, :new, :index, :destroy]
  end

  resources :users,     only: :show
  resources :favorites, only: :index
  resources :reviews,   only: :index
end
