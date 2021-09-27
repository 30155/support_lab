Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :notes, only: [:index, :create, :edit, :update, :destroy]
end
