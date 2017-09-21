Rails.application.routes.draw do
  devise_for :users

  root 'consumers/jobs#index'

  namespace :consumers do
    resources :jobs
  end
end
