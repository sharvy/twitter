# frozen_string_literal: true

require 'system_helper'

RSpec.describe 'User can login by visiting /users/sign_in url', type: :system, js: true do
  let!(:user) { create(:user, password: '123456') }

  it 'fills up the login form and logins successfully' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: '123456'

    click_button 'Log in'

    expect(current_path).to eql(root_path)
  end
end
