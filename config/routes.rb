Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root "home#show"
  get '/dashboard', to: 'dashboard#show'

  resources :workouts, only: [:show, :index]
  resources :user_races, only: [:new, :create, :edit, :update, :destroy]
end
