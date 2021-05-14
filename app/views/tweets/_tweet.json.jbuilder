# frozen_string_literal: true

json.key_format! camelize: :lower
json.extract! tweet, :text, :id, :parent_id

json.author JSON.parse(render(partial: 'users/user.json.jbuilder', object: tweet.user))

# TODO(Sharvy): Put comments into a Tweet decorator or a query object
json.comments tweet.comments.order(created_at: :asc), partial: 'tweets/tweet', as: :tweet
