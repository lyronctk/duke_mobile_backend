module Api
  module V1
    class RegistrationsController < ApplicationController

      def create
        data = params[:data].slice(
          :first_name, :last_name, :email, :password
        ).permit!
        user = User.new(data)
        user.password_confirmation = user.password
        process_resource(user)
      end

    end
  end
end
