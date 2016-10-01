# Handles user registration
class RegistrationService < ApplicationService
  include ActiveAttr::Model
  attribute :first_name, type: String
  attribute :last_name, type: String
  attribute :email, type: String
  attribute :password, type: String

  def action # => Result
    user = User.new(attributes)
    if user.save
      Success.new(user_id: user.id)
    else
      Failure.new(user.errors)
    end
  end
end
