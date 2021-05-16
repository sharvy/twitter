# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:global]
  def index
    following_ids = current_user.followees.pluck(:id)
    @tweets = TweetsQuery.new(user_ids: following_ids).call
  end

  def global
    @tweets = TweetsQuery.new.call
  end
end
