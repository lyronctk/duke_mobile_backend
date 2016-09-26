module Api
  module V1
    class RegistrationsController < ApplicationController

      def create
        service = RegistrationService.new(params[:data])
        service.run
        render json: service.result, status: service.status
      end
    end
  end
end
