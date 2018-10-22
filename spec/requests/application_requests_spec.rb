require 'rails_helper'

RSpec.describe "Application requests", type: :request do
  describe "Test request" do
    it 'should get API version' do
      get '/api_version'
      expect(response.content_type).to eq('application/json')
      expect(response_json['api-version']).to eq('0.01')
    end
  end
end