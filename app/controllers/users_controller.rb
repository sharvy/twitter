# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show follow unfollow]
  before_action :set_user, only: %i[show follow unfollow]

  def show
    @tweets = TweetsQuery.new(user_ids: [@user.id]).call
  end

  def follow
    current_user.follow!(@user)
    render json: { following: true }, status: 201
  end

  def unfollow
    current_user.unfollow!(@user)
    render json: { following: false }, status: 200
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
