Rails.application.routes.draw do
  root_path "cafes#index"
  resources :cafes, only: :index
end
