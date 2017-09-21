Rails.application.routes.draw do
  devise_for :users

  root 'consumers/jobs#index'

  resources :jobs, only: [:index, :show] do
    get :accepted, on: :collection
    put :accept, on: :member
    put :cancel, on: :member
  end

  namespace :consumers do
    resources :jobs
    resources :invitations, only: [:index, :create]
  end
end
