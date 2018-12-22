require 'devise/jwt/test_helpers'
module RequestHelper
  def response_json
    JSON.parse(response.body)
  end

  def request_header
    user = create(:user)
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
  end

end
