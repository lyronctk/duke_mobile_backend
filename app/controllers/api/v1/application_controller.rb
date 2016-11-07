module Api
  module V1
    # Base class for the API
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :null_session

      private

      rescue_from ActiveRecord::RecordNotFound do
        render json: {
          success: false,
          errors: [{
            pointer: 'path/id',
            message: 'Not found',
            reason: 'Could not find resource with provided id'
          }]
        }, status: 404
      end

      # rescue_from Exception do
      #   render json: {
      #     success: false,
      #     errors: [{
      #       pointer: 'server',
      #       message: 'Something went wrong',
      #       reason: 'Server error. Please contact the adminisrtator'
      #     }]
      #   }, status: 500
      # end

      def render_service(service)
        result = service.run
        render json: result.to_h, status: result.status
      end
    end
  end
end
