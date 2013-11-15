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
  get "/unauthorized", to: "info#unauthorized", as: "unauthorized"

  devise_for :users

  resources :users , only: [:index, :show]

  resources :portraits
end
