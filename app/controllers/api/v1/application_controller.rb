module Api
  module V1
    # Base class for the API
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :null_session
    end
  end
end
