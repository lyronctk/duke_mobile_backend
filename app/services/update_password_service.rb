class UpdatePasswordService < ApplicationService
  include ActiveAttr::Model
  attribute :email, type: String
  attribute :new_password, type: String

  def action
    user = User.find_by!(email: email)
    user.password = new_password
    if user.save
      @result_data = {}
      true
    else
      @errors = user.errors
      false
    end
  end
end
