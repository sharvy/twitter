# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @tweets = TweetsQuery.new.call
  end
end
