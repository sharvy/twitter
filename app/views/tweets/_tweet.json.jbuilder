# frozen_string_literal: true

json.key_format! camelize: :lower
json.extract! tweet, :text, :id, :parent_id

user = UserDecorator.new(tweet.user)

json.author user.full_name

# TODO(Sharvy): Put comments into a Tweet decorator or a query object
json.comments tweet.comments.order(created_at: :asc), partial: 'tweets/tweet', as: :tweet
