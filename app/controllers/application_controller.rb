class ApplicationController < ActionController::API
  def api_version
    render json: {"api-version": "0.01" }
  end
end
