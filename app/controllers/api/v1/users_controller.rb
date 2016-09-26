module Api
  module V1
    class UsersController < ApplicationController

      def update
        data = params[:data].slice(
          :email, :new_password
        ).permit!
        user = User.find_by(email: data[:email])
        user.password = data[:new_password]
        if user.save
          render json: {
            success: true,
            status: 200,
            data: {}
          }
        else
          errors = []
          user.errors.each do |attribute, message|
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
