Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"
  root to: 'shops#index'
  resources :shops, only: [:index, :show] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show
end
