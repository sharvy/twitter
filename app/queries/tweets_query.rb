# frozen_string_literal: true

class TweetsQuery
  def initialize(user_ids: nil, relation: nil)
    @user_ids = user_ids
    @relation = relation || Tweet.includes(:user, comments: :user).only_parents
  end

  def call
    of_users
  end

  private

  def of_users
    return @relation unless @user_ids.present?

    @relation.where(user_id: @user_ids)
  end
end
