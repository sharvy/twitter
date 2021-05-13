# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user

  validates_presence_of :text, :user_id

  scope :latest, -> { all.order(created_at: :desc) }
end
