Rails.application.routes.draw do
  resources :users, only: :show do
    resources :games, only: :create
  end

  resources :games do
    resources :movements, only: :create
  end
end
