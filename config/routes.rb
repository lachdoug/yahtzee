Rails.application.routes.draw do

  root to: 'homes#show'

  devise_for :users
  # resources :users, only: [:show]
  resources :apps
  resources :run_apps, only: [:index, :show]
  resource :clone_app, only: [:index, :show]
  resource :code, only: [:show, :update]
  resource :publish, only: [:show, :update]
  resource :exercise_apps, only: [:destroy]

  resource :docs, only: [:show]
  resources :chapters
  resources :pages
  resource :move_page, only: [:show]
  resources :sections

  resources :games, only: [:index, :show, :new, :update, :destroy]

  resource :yahtzee, module: :yahtzee do
    resource :game, only: [:show]
    resource :roll, only: [:create]
    resource :complete_turn, only: [:create]
  end

  resource :server, only: [:show]
  resource :fake_post, only: [:create]

  resource :client, only: [:show]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

end
