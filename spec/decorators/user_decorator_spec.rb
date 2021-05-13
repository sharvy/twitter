# frozen_string_literal: true

RSpec.describe UserDecorator do
  let(:user) { create(:user) }

  describe '#full_name' do
    it 'shows full name of a user' do
      decorated_user = UserDecorator.new(user)

      expect(decorated_user.full_name).to include(user.first_name)
      expect(decorated_user.full_name).to include(user.last_name)
    end
  end
end
