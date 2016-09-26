module Api
  module V1
    class UsersController < ApplicationController
      def update_password
        data = params[:data].slice(
          :email, :new_password
        ).permit!
        user = User.find_by!(email: data[:email])
        user.password = data[:new_password]
        process_resource(user)
      end
    end
  end
end
