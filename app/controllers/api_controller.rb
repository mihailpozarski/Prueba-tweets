class ApiController < ActionController::API
  def news
    @tweets = Tweet.all.order(created_at: :desc).limit(50)
    @tweets = @tweets.map do |tweet|
                {
                  id: tweet.id,
                  content: tweet.text,
                  user_id: tweet.user.id,
                  likes_count: tweet.likes.count,
                  retweets_count: tweet.retweets.count,
                  rewtitted_from: nil
                }
              end
    render json: @tweets
  end
end
