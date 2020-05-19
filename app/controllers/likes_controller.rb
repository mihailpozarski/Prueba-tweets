class LikesController < ApplicationController
  def index
    @like = Like.find_by(tweet: tweet, user: current_user)
    if @like
      @like.destroy
    else
      tweet.likes.create(tweet: tweet, user: current_user)
    end
    redirect_to root_path
  end

  private

  def tweet
    @tweet ||= Tweet.find(params.require(:tweet_id))
  end
end
