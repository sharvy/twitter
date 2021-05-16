# frozen_string_literal: true

RSpec.describe 'A not logged in user can see one feed' do
  let!(:user2) { create(:user) }
  let!(:user3) { create(:user) }

  let!(:tweet2) { create(:tweet, user: user2) }
  let!(:tweet3) { create(:tweet, user: user3) }

  it 'will show everyones tweets on homepage' do
    visit root_path
    expect(page).to have_content tweet2.text
    expect(page).to have_content tweet3.text
  end
end
