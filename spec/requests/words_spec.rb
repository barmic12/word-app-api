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
        before do
          @before_added = Word.count
          post words_path, params: params, headers: request_header
        end

        it 'creates record' do
          expect(Word.count).to eq(@before_added+1)
        end

        it 'returns created status' do
          expect(response).to have_http_status(201)
        end

        it 'returns created word' do
          expect(response_json['description']).to eq(params[:word][:description])
        end
      end

      context 'when params are incorrect' do
        context 'word param is missing' do
          before { post words_path, headers: request_header }

          it 'returns 400 status' do
            expect(response).to have_http_status(400)
          end

          it 'returns proper error title' do
            expect(response_json['errors'].first['title']).to eq('Parametr Missing')
          end

          it 'returns proper error details' do
            expect(response_json['errors'].first['details']).to eq('param is missing or the value is empty: word')
          end
        end

        context 'description is empty' do
          before do
            params[:word][:description] = nil
            post words_path, headers: request_header, params: params
          end

          it 'returns 400 status' do
            expect(response).to have_http_status(400)
          end

          it 'returns proper error title' do
            expect(response_json['errors'].first['title']).to eq('Bad request')
          end

          it 'returns proper error details' do
            expect(response_json['errors'].first['details']['description'].first).to eq('can\'t be blank')
          end

        end

      end
    end

    context 'when user is not authenticated' do
      before { post words_path, params: params }

      it 'return 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
end
