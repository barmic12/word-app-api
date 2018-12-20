require 'rails_helper'

RSpec.describe "POST /login", type: :request do
  describe "GET /login" do
    let(:user) { create(:user) }
    let(:params) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end
    let(:url) { user_session_path }

    context 'when params are correct' do

      before do
        post url, params: params
      end

      it "returns 200" do
        expect(response).to have_http_status(200)
      end

      it 'return JWT token in authorization header' do
        expect(response.headers['Authorization']).to be_present
      end
    end

    context 'when params are incorrect' do
      before { post url }
      it 'returns 401' do
        expect(response).to have_http_status(401)
      end
    end

  end
end
