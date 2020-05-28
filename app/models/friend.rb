# == Schema Information
#
# Table name: friends
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  friend_id  :integer
#  user_id    :integer
#
# Indexes
#
#  index_friends_on_friend_id  (friend_id)
#  index_friends_on_user_id    (user_id)
#
class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: :User, foreign_key: 'friend_id'
end
