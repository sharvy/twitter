# frozen_string_literal: true

require 'system_helper'

RSpec.describe 'User can signup by visiting the /users/sign_up url', type: :system, js: true do
  it 'fills up the signup form and signups successfully' do
    visit new_user_registration_path

    fill_in 'Email', with: 'sharvy@gmail.com'
    fill_in 'Password', with: 'Sharvy'
    fill_in 'Password confirmation', with: 'Sharvy'
    click_button 'Sign up'

    expect(current_path).to eql(root_path)
  end
end
