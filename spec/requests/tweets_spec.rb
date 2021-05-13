require 'rails_helper'

RSpec.describe 'Tweets', type: :request do
  describe 'POST /tweets' do
    let(:params) { { tweet: { text: 'Dummy Tweet!' } } }
    context 'When logged in' do
      before do
        login_as(create(:user))
      end

      context 'With valid params' do
        it 'returns http status created 201' do
          post tweets_path, params: params
          expect(response).to have_http_status(:created)
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
