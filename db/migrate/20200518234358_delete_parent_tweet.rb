class DeleteParentTweet < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :tweets, :tweet
  end
end
