# frozen_string_literal: true

RSpec.describe 'A logged in user can see multiple feeds' do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:user3) { create(:user) }

  let!(:tweet2) { create(:tweet, user: user2) }
  let!(:tweet3) { create(:tweet, user: user3) }

  before do
    login_as(user1)
    user1.follow!(user2)
  end

  it 'will show only tweets of following users on home feed' do
    visit root_path
    click_link 'Home'

    expect(page).to have_content tweet2.text
    expect(page).not_to have_content tweet3.text
  end

  it 'will show everyones tweets on global feed' do
    visit root_path
    click_link 'Global'

    expect(page).to have_content tweet2.text
    expect(page).to have_content tweet3.text
  end
end
