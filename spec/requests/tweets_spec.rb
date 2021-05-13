require 'rails_helper'

RSpec.describe 'Tweets', type: :request do
  let!(:user) { create(:user) }

  describe 'POST /tweets' do
    let(:params) { { tweet: { text: 'Dummy Tweet!' } } }

    context 'When logged in' do
      before do
        login_as(user)
      end

      context 'With valid params' do
        subject(:post_request) do
          post tweets_path, params: params
        end

        it 'returns http status created 201' do
          post_request
          expect(response).to have_http_status(:created)
        end

        it 'creates a tweet' do
          expect { post_request }.to change { Tweet.count }.from(0).to(1)
        end

        it 'creates a tweet comment when parent_id is provided' do
          tweet = create(:tweet, user: user)
          post tweets_path, params: { tweet: { text: 'Dummy Tweet!', parent_id: tweet.id } }

          expect(tweet.comments.count).to eql(1)
        end
      end

      context 'With invalid params' do
        it 'returns http status unprocessable_entity 422' do
          post tweets_path, params: { tweet: { user_id: 1 } }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'When not logged in' do
      it 'redirects to sign in path' do
        post tweets_path, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
