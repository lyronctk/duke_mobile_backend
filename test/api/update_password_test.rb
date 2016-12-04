require 'test_helper'

class UpdatePasswordTest < ActionDispatch::IntegrationTest
  test "updates a user's password" do
    data = {
      email: "lyronctk@gmail.com",
      new_password: "newpassword"
    }
    post api_v1_update_password_path, auth_request_data(data, users(:faraz))

    assert_json_failure('Not authorized for access')
    user = User.find_by(email: 'lyronctk@gmail.com')
    assert_not_equal user, user.authenticate('newpassword')

    post api_v1_update_password_path, auth_request_data(data, users(:lyron))

    assert_json_success
    user = User.find_by(email: 'lyronctk@gmail.com')
    assert_equal user, user.authenticate('newpassword')
  end
end
