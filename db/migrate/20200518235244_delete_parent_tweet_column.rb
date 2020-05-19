class DeleteParentTweetColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :tweet_id
  end
end
