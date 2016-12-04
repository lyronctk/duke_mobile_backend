# Handles user registration
class RegistrationService < ApplicationService
  
  attribute :first_name
  attribute :last_name
  attribute :email
  attribute :password

  def action # => Result
    user = User.new(attributes)
    if user.save
      Success.new user_id: user.id
    else
      Failure.new user.errors
    end
  end
end
