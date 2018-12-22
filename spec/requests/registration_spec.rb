require 'rails_helper'

RSpec.describe "POST /signup", type: :request do
  describe "GET /registrations" do
    let(:user) { build(:user) }
    let(:params) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end
    let(:url) { user_registration_path}
    context 'with correct params' do
      before do
        post url, params: params
      end

      it 'returns 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when username is already taken' do
      before do
        create(:user, email: params[:user][:email])
        post url, params: params
      end

      it 'returns bad request status' do
        expect(response).to have_http_status(400)
      end

      it 'returns error title in response' do
        expect(response_json['errors'].first['title']).to eq('Bad request')
      end

      it 'returns validation error in response' do
        expect(response_json['errors'].first['details']['email'].first).to eq('has already been taken')
      end

    end
  end
end
