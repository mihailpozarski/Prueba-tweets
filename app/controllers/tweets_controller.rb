class TweetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @tweets = Tweet.includes(:likes, :retweets).order(id: :desc).page params[:page]
  end

  def show
    @tweet = Tweet.find(params.require(:id))
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new tweet_create_params
    if @tweet.save
      redirect_to action: 'show', id: @tweet.id
    else
      render :new
    end
  end

  def destroy
  end

  def create_retweet
    retweet_tweet = Tweet.find(params.require(:id)) 
    @tweet = Tweet.new(
      text: retweet_tweet.text,
      user: current_user,
      tweet_id: retweet_tweet.id
    )
    if @tweet.save
      redirect_to action: 'show', id: @tweet.id
    else
      render :new
    end
  end

  private

  def tweet_create_params
    params.require(:tweet).permit(:text).merge(user: current_user)
  end
end