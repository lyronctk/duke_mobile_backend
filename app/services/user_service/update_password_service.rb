# Handles user password updates
class UpdatePasswordService < ApplicationService
  
  attribute :email
  attribute :new_password
  attribute :user

  def action
    cur_user = User.find_by!(email: email)
    return Failure.new(user: 'Not authorized for access') unless user == cur_user
    cur_user.password = new_password
    if cur_user.save
      Success.new
    else
      Failure.new cur_user.errors
    end
  end
end
