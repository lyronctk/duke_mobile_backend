module Api
  module V1
    class RegistrationsController < ApplicationController
      def create
        data = params[:data].slice(
          :first_name, :last_name, :email, :password
        ).permit!
        user = User.new(data)
        user.password_confirmation = user.password
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
