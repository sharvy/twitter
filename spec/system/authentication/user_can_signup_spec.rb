# frozen_string_literal: true

require 'faker'
require 'system_helper'

RSpec.describe 'User can signup by visiting the /users/sign_up url', type: :system, js: true do
  it 'fills up the signup form and signups successfully' do
    visit new_user_registration_path

    fill_in 'First name', with: 'Sharvy'
    fill_in 'Last name', with: 'Ahmed'
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: 'Pa$$word'
    fill_in 'Password confirmation', with: 'Pa$$word'
    click_button 'Sign up'

    expect(current_path).to eql(root_path)
  end
end
