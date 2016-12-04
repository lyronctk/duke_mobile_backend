module Api
  module V1
    # Reponsible for handling registrations
    class RegistrationsController < ApplicationController
    	skip_before_action :authenticate_request, only: [:create]
      def create
        render_service RegistrationService.new(params[:data])
      end
    end
  end
end
