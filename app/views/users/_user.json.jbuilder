# frozen_string_literal: true

json.key_format! camelize: :lower
json.extract! user, :id

decorated_user = UserDecorator.new(user)

json.full_name decorated_user.full_name
json.profile_url decorated_user.profile_url
json.follow_url decorated_user.follow_url
json.unfollow_url decorated_user.unfollow_url
