# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @tweets = Tweet.latest
  end
end
