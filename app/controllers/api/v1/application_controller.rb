module Api
  module V1
    class ApplicationController < ::ApplicationController
      protect_from_forgery with: :null_session

      private

      def process_resource(resource)
        if resource.save
          render json: {
            success: true,
            status: 200,
            data: {}
          }
        else
          errors = []
          resource.errors.each do |attribute, message|
            errors.push(
              pointer: "data/#{attribute}",
              message: "#{attribute.to_s.humanize} #{message}",
              reason: message
            )
          end

          render json: {
            success: false,
            status: 422,
            errors: errors
          }, status: 422
        end
      end

    end
  end
end
