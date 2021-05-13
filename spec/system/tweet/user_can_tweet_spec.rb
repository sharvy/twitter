# frozen_string_literal: true

require 'system_helper'

RSpec.describe 'User can tweet by visiting homepage', type: :system, js: true do
  before do
    login_as(create(:user))
  end

  subject do
    visit root_path
    fill_in 'Your tweet...', with: 'Hello World!'
    click_button 'Tweet'
  end

  it 'tweets successfully' do
    subject
    expect(page).to have_content('Hello World!')
  end

  it 'shows tweets posted by others' do
    subject
    using_session('other') do
      visit root_path
      expect(page).to have_content('Hello World!')
    end
  end
end
