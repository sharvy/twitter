# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def create
    tweet = current_user.tweets.create!(tweet_params)
    tweet_json = render_json('/tweets/tweet.json.jbuilder', tweet)

    ActionCable.server.broadcast('AllUsersTweetsChannel', tweet_json)
    render json: tweet_json, status: 201
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text, :parent_id)
  end
end
