Rails.application.routes.draw do
  namespace :users do
    patch "account_update"
    patch "profile_update"
    get 'account'
    get 'profile'
  end
  devise_for :users
  root "home#index"
  resources :reservations, except: [:new]
  post "reservations/new"
  resources :rooms, except: [:edit, :update] do
    get "search", on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
