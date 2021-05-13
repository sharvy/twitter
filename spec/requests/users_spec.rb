# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  before do
    sign_in user1
  end

  describe 'GET /users/:id' do
    it 'returns http success' do
      get user_path(user1)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /users/:id/follow' do
    subject { post follow_user_path(user2) }

    it 'returns http status created (201)' do
      subject
      expect(response).to have_http_status(:created)
    end

    it 'returns json response with following true' do
      subject
      expect(JSON.parse(response.body)['following']).to be true
    end

    it 'adds current user as a follower of the user' do
      subject
      expect(user1.follows?(user2)).to be true
    end
  end

  describe 'POST /users/:id/unfollow' do
    subject do
      user1.follow!(user2)
      post unfollow_user_path(user2)
    end

    it 'returns http status success (200)' do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'returns json response with following false' do
      subject
      expect(JSON.parse(response.body)['following']).to be false
    end

    it 'removes current user from users followers list' do
      subject
      expect(user1.follows?(user2)).to be false
    end
  end
end
