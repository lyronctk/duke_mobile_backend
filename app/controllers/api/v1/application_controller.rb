module Api
  module V1
    # Base class for the API
    class ApplicationController < ActionController::Base
      # protect_from_forgery with: :null_session
      before_action :authenticate_request
      attr_reader :current_user

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

      def render_service(service)
        result = service.run
        render json: result.to_h, status: result.status
      end

      def authenticate_request
        result = AuthorizeApiRequestService.new(request.headers).run
        @current_user = result.to_h[:data][:user] if result.success?
        render json: result.to_h, status: result.status unless @current_user
      end

      def params_with_user(params)
        return params.merge(user: current_user) if params
        {user: current_user}
      end
    end
  end
end
