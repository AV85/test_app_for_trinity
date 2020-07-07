Rails.application.routes.draw do
  root to: 'home#index'

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :authors
    resources :books
  end
end