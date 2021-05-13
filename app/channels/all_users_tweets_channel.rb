# frozen_string_literal: true

class AllUsersTweetsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'AllUsersTweetsChannel'
  end
end
