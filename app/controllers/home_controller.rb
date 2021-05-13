# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @tweets = Tweet.only_parents.includes(:user, :comments).latest
  end
end
