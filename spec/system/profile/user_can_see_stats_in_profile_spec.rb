# frozen_string_literal: true

RSpec.describe 'User visits a profile, sees tweets and stats' do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }

  before do
    login_as user1
  end

  subject do
    visit user_path(user2)
  end

  it 'shows number of followers' do
    user1.follow!(user2)

    subject
    expect(page).to have_content('Followers 1')
  end

  it 'shows numbers of follwing' do
    user2.follow!(user1)

    subject
    expect(page).to have_content('Following 1')
  end

  it 'shows user tweets' do
    user1_tweet = create(:tweet, text: 'Keep it silly and simple. - user1', user: user1)
    user2_tweet = create(:tweet, text: 'Keep it silly and simple. - user2', user: user2)

    subject
    expect(page).not_to have_content(user1_tweet.text)
    expect(page).to have_content(user2_tweet.text)
  end
end
