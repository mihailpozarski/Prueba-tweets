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
  post 'api/create_tweet', to: 'api#create_tweet'
  post 'api/:fecha1/:fecha2', to: 'api#between_dates'
  post 'api/news'
  post '/tweets/:id', to: 'tweets#create_retweet'

  root 'tweets#index'
end
