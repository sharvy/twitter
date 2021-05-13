# frozen_string_literal: true

json.key_format! camelize: :lower
json.extract! tweet, :text, :id
