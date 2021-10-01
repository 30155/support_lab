Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :notes, only: [:index, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
  resources :experiments, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :schedules, only: [:index, :create]
end
