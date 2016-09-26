class RegistrationService < ApplicationService
  include ActiveAttr::Model
  attribute :first_name, type: String
  attribute :last_name, type: String
  attribute :email, type: String
  attribute :password, type: String

  def action
    user = User.new(attributes)
    if user.save
      @result_data = { user_id: user.id }
      true
    else
      @errors = user.errors
      false
    end
  end
end
