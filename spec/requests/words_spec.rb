require 'rails_helper'

RSpec.describe "Words", type: :request do
  describe "POST /words" do
    let(:user) { create(:user) }
    let(:list) { create(:list) }

    let(:params) do
      {
        word: {
          description: 'English word',
          list_id: list.id
        }
      }
    end
    context 'when user is authenticated' do

      context 'when params are correct' do
        before { post words_path, params: params, headers: request_header }

        it 'returns created status' do

        end

        it 'returns created word' do

        end
      end

      context 'when params are incorrect' do
        before { post words_path, headers: auth_headers }

        it 'returns 422 status' do

        end
      end
    end

    context 'when user is not authenticated' do
      before { post words_path, params: params }

      it 'return 401' do

      end
    end
  end
end
