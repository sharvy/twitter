require 'rails_helper'

RSpec.describe AllUsersTweetsChannel, type: :channel do
  before do
    subscribe
  end

  describe '#subscribed' do
    it 'streams tweets from AllUsersTweetsChannel' do
      expect(subscription).to be_confirmed
    end
  end
end
