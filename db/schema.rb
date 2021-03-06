# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150828004151) do

  create_table "hashtags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hashtags_tweets", id: false, force: true do |t|
    t.integer "hashtag_id", null: false
    t.integer "tweet_id",   null: false
  end

  add_index "hashtags_tweets", ["hashtag_id", "tweet_id"], name: "index_hashtags_tweets_on_hashtag_id_and_tweet_id"
  add_index "hashtags_tweets", ["tweet_id", "hashtag_id"], name: "index_hashtags_tweets_on_tweet_id_and_hashtag_id"

  create_table "tweets", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tweetid"
  end

end
