# == Schema Information
#
# Table name: retweets
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tweet_id   :integer
#  user_id    :integer
#
# Indexes
#
#  index_retweets_on_tweet_id  (tweet_id)
#  index_retweets_on_user_id   (user_id)
#
class Retweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
end
