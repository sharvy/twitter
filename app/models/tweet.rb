# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :parent, class_name: 'Tweet', optional: true

  has_many :comments, class_name: 'Tweet', foreign_key: 'parent_id'

  validates_presence_of :text, :user_id

  scope :latest, -> { order(created_at: :desc) }
  scope :only_parents, -> { where(parent_id: nil) }
end
