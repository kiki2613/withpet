Rails.application.routes.draw do
  root to: 'cafes#index'
  resources :cafes, only: :index
end
