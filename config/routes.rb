Rails.application.routes.draw do
  resources :users, only: :show
  resources :games do
    resources :movements, only: :create
  end
end
