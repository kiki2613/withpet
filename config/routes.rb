Rails.application.routes.draw do
  root to: 'shops#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"
  
  resources :shops, only: [:index, :show] do
    resource  :favorites, only: [:create, :destroy,]
    resources :reviews,   only: [:create, :destroy, :new, :edit, :update]
  end

  resources :users,     only: :show
  resources :favorites, only: :index
  resources :reviews,   only: :index
end
