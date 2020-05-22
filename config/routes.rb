Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :users do
    resources :friends
  end
  resources :tweets do
    resources :likes
    resources :retweet
  end
  post '/tweets/:id' => 'tweets#create_retweet'

  root 'tweets#index'
end
