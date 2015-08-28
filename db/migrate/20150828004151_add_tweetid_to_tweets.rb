class AddTweetidToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :tweetid, :string
  end
end
