# frozen_string_literal: true

class UserDecorator < SimpleDelegator
  def full_name
    "#{first_name} #{last_name}"
  end

  def profile_url
    Rails.application.routes.url_helpers.user_path(self)
  end

  def follow_url
    Rails.application.routes.url_helpers.follow_user_path(self)
  end

  def unfollow_url
    Rails.application.routes.url_helpers.unfollow_user_path(self)
  end
end
