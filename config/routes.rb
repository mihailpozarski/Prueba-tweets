Rails.application.routes.draw do
  devise_for :users

  resources :tweets do
    resources :likes
  end
  post '/tweets/:id' => 'tweets#create_retweet'

  root 'tweets#index'
end
