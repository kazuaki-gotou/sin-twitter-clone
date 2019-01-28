class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :update, :destroy, :edit]

  def top
  end
  
  def index
    @tweets = Tweet.all
  end

  
  
  def show
  end

  
  def new
    if params[:back]
      @tweet = Tweet.new(tweet_params)
    else
      @tweet = Tweet.new
    end
  end

  
  def edit
  end

  
  
  def create
    @tweet = Tweet.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  
  
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  
  
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
    end
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end

  private
   
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

   
    def tweet_params
      params.require(:tweet).permit(:content)
    end
end