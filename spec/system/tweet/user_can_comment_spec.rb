# frozen_string_literal: true

require 'system_helper'

RSpec.describe 'User can comment a Tweet', type: :system, js: true do
  let!(:user) { create(:user) }
  let!(:tweet) { create(:tweet, user: user) }

  before do
    login_as(user)
  end

  subject do
    visit root_path
    fill_in 'Your comment...', with: 'This is a comment!'
    click_button 'Comment'
  end

  it 'comments successfully' do
    subject
    expect(page).to have_content('This is a comment!')
  end
end
