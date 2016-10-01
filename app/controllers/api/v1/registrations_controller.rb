module Api
  module V1
    # Reponsible for handling registrations
    class RegistrationsController < ApplicationController
      def create
        render_service RegistrationService.new(params[:data])
      end
    end
  end
end
