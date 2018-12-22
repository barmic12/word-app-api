class ApplicationController < ActionController::API
  def api_version
    render json: {"api-version": "0.01" }
  end

  def render_resource(resource, status)
    if resource.errors.empty?
      render json: resource, status: status
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: 400,
          title: 'Bad request',
          details: resource.errors
        }
      ]
    }, status: 400
  end

  def render_error(status, title, details)
    render json: {
      errors: [
        {
          title: title,
          details: details
        }
      ]
    }, status: status
  end
end
