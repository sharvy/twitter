# frozen_string_literal: true

module Followable
  class FollowSelfError < StandardError; end

  class AlreadyFollowingError < StandardError; end

  extend ActiveSupport::Concern

  included do
    has_many :follower_users, foreign_key: :followee_id, class_name: 'Follow', dependent: :destroy
    has_many :followers, through: :follower_users

    has_many :followee_users, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy
    has_many :followees, through: :followee_users
  end

  # Create a new {Follow follow} relation.
  #
  # @param [User] user the object to be followed.
  # @return [Boolean]
  def follow!(user)
    raise Followable::FollowSelfError if self == user
    raise Followable::AlreadyFollowingError if follows?(user)

    !!followee_users.create(followee: user)
  end

  # Specifies if self is already following {User} object.
  #
  # @param [User] user the {User} object to test against.
  # @return [Boolean]
  def follows?(user)
    followee_users.exists?(followee_id: user.id)
  end

  # Delete a {Follow follow} relation.
  #
  # @param [User] user the {User} object to unfollow.
  # @return [Boolean]
  def unfollow!(user)
    relation = followee_users.find_by(followee_id: user.id)

    !!relation.destroy
  end
end
