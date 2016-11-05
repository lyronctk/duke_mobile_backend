module Api
  module V1
    # Base class for the API
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :null_session

      private

      def render_service(service, request_info={})
        result = service.run(request_info)
        render json: result.to_h, status: result.status
      end
    end
  end
end
