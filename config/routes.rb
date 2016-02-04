Rails.application.routes.draw do

  root 'home#welcome'

  devise_for :users

  namespace :account do
    resource :profile, only: :show
    resources :profile_data_steps
  end

end