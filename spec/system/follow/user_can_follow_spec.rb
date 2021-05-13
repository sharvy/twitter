# frozen_string_literal: true

RSpec.describe 'User can follow another user' do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:tweet) { create(:tweet, user: user2) }

  before do
    login_as(user1)
  end

  subject do
    visit root_path
    click_link "#{user2.first_name} #{user2.last_name}"
    click_button 'Follow'
  end

  it 'follows successfully' do
    subject
    expect(page).to have_content 'Unfollow'
  end
end
