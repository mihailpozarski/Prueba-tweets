# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_tweets_on_user_id  (user_id)
#
class Tweet < ApplicationRecord
  belongs_to :user
  has_many :retweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  scope :tweets_for_me, ->(friends) { where(user: friends).order(id: :desc) }

  validates_presence_of :text, on: :create, message: "can't be blank"

  def liked_by?(liking_user)
    likes.any? { |l| l.user == liking_user }
  end
end
