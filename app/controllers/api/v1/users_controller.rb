module Api
  module V1
    # Reponsible for handling users
    class UsersController < ApplicationController
    	skip_before_action :authenticate_request, only: [:authenticate]

      def update_password
        render_service UpdatePasswordService.new params_with_user(params[:data])
      end

      def authenticate
      	render_service AuthenticateUserService.new(params[:data])
      end
    end
  end
end
