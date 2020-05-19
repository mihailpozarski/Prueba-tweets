class TweetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @tweet = Tweet.new
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
      redirect_to root_path
    else
      render root_path
    end
  end

  def destroy
  end

  def create_retweet
    @tweet = Tweet.find(params.require(:id)) 
    @retweet = @tweet.retweets.new(user: current_user)
    if @retweet.save
      redirect_to root_path
    else
      render root_path
    end
  end

  private

  def tweet_create_params
    params.require(:tweet).permit(:text).merge(user: current_user)
  end
end
