module Api
  module V1
    # Reponsible for handling users
    class UsersController < ApplicationController
      def update_password
        render_service UpdatePasswordService.new(params[:data])
      end
    end
  end
end
