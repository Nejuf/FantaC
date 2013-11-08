Fantac::Application.routes.draw do
  resources :tiers

  resources :positions

  resources :payout_types

  resources :entries

  resources :contest_positions

  resources :character_entries

  resources :categories

  resources :battle_rosters

  resources :affinities

  resources :contests

  resources :battles

  resources :characters

  root to: "info#index"
  devise_for :users

  get "users/index", to: "users#index"
  get "users/:id", to: "users#show"

end