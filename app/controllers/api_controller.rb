class ApiController < ActionController::API
  acts_as_token_authentication_handler_for User

  def news
    @tweets = Tweet.all.order(created_at: :desc).limit(50)
    @tweets = jsoned_tweets @tweets
    render json: @tweets
  end

  def between_dates
    @tweets = Tweet.where(created_at: date1..date2)
    @tweets = jsoned_tweets @tweets
    render json: @tweets
  end

  def create_tweet
    @tweet = Tweet.create(
      text: params.require(:text),
      user: current_user
    )

    render json: @tweet
  end

  private

  def date1
    params[:fecha1]&.to_date&.beginning_of_day
  end

  def date2
    params[:fecha2]&.to_date&.end_of_day
  end

  def jsoned_tweets(tweets)
    unless date1.nil? && date2.nil?
      return { message: "pon las fechas bien tonto" } if date1 > date2
    end

    tweets.map do |tweet|
      {
        id: tweet.id,
        content: tweet.text,
        user_id: tweet.user.id,
        likes_count: tweet.likes.count,
        retweets_count: tweet.retweets.count,
        rewtitted_from: nil
      }
    end
  end
end
