Rails.application.routes.draw do
  devise_for :users

  resources :tweets do
    resources :likes
    resources :retweet
  end
  post '/tweets/:id' => 'tweets#create_retweet'

  root 'tweets#index'
end
