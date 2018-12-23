class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :render_parameter_missing

  def api_version
    render json: {"api-version": "0.01" }
  end

  def render_resource(resource, status)
    if resource.errors.empty?
      render json: resource, status: status
    else
      render_error(422, 'Validation error', resource.errors)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
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

  def render_parameter_missing(exception)
    render_error(422, 'Missing parameter', exception.message)
  end

end
