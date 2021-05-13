require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:user) {create(:user)}

  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:user_id) }

  it { should belong_to(:user) }
  it { should belong_to(:parent).optional }
  it { should have_many(:comments) }

  describe '.latest' do
    it 'shows all tweets in descending order' do
      create_list(:tweet, 2, user: user)
      tweet3 = create(:tweet, user: user)

      expect(Tweet.latest.first.id).to eq(tweet3.id)
    end
  end

  describe '.only_parents' do
    it 'filter outs comments from tweets' do
      tweet = create(:tweet, user: user)
      create(:tweet, user: user, parent_id: tweet.id)

      expect(Tweet.count).to eq(2)
      expect(Tweet.only_parents.count).to eq(1)
    end
  end
end
