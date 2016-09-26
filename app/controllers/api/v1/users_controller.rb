module Api
  module V1
    class UsersController < ApplicationController
      def update_password
        service = UpdatePasswordService.new(params[:data])
        service.run
        render json: service.result, status: service.status
      end
    end
  end
end
