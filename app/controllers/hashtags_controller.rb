class HashtagsController < ApplicationController
  before_action :set_hashtag, only: [:show, :edit, :update, :destroy]

  # GET /hashtags
  # GET /hashtags.json
  def index
    @hashtags = Hashtag.all
  end

  # GET /hashtags/1
  # GET /hashtags/1.json
  def show
  end

  # GET /hashtags/new
  def new
    @hashtag = Hashtag.new
  end

  # GET /hashtags/1/edit
  def edit
  end

  # POST /hashtags
  # POST /hashtags.json
  def create
    @hashtag = Hashtag.new(hashtag_params)

    respond_to do |format|
      if @hashtag.save
        format.html { redirect_to @hashtag, notice: 'Hashtag was successfully created.' }
        format.json { render :show, status: :created, location: @hashtag }
      else
        format.html { render :new }
        format.json { render json: @hashtag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hashtags/1
  # PATCH/PUT /hashtags/1.json
  def update
    respond_to do |format|
      if @hashtag.update(hashtag_params)
        format.html { redirect_to @hashtag, notice: 'Hashtag was successfully updated.' }
        format.json { render :show, status: :ok, location: @hashtag }
      else
        format.html { render :edit }
        format.json { render json: @hashtag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hashtags/1
  # DELETE /hashtags/1.json
  def destroy
    @hashtag.destroy
    respond_to do |format|
      format.html { redirect_to hashtags_url, notice: 'Hashtag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end






def search_tweets

  @hashtag=Hashtag.find_or_create_by(name: params[:name])
  @search_tag= params[:name]



twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = "dguOPv8JV05Xy4M2C3uCR4ClA"
  config.consumer_secret ="XWz4KXO5efgXziSFJHIotKEpVfGvuA5d01sns7HZEN1kT9jzmC"
  config.access_token = "3361041133-tjRNIQL8GPO34ErOhPNKJZoYr0RnnOCfm2zPgh3"
  config.access_token_secret = "ykozMzF4nO6E2euTXpoKGgVcweB9l9yRX0iWgxtzrkR9m"
end



# Twitter.search("#ruby -rt", :lang => "ja", :count => 1).results.size


@result=  twitter.search("#"+ @search_tag, :count => 3) 

 if @result && @result.count>0
   @hashtag.save
     @result. each do  |tweet|
       tweetidd = tweet.id
       @tweet= Tweet.find_or_create_by(tweetid: tweetidd)
       @tweet.text = tweet.text
       @hashtag.tweets<< @tweet
       @hashtag.save
       @tweet.save
     end
end
end


def searchform
  @hashtag=  Hashtag.new
 end


def tweetlist
  @hashtag= Hashtag.find_by_name(params[:name])
  @tweets= @hashtag.tweets
 end










  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hashtag
      @hashtag = Hashtag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hashtag_params
      params.require(:hashtag).permit(:name)
    end
end
