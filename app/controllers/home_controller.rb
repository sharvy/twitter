# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @tweets = Tweet.includes(:user, comments: :user).only_parents.latest
  end
end
