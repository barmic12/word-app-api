class ApplicationController < ActionController::API
  def api_version
    render json: {"api-version": "0.01" }
  end

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
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
end
