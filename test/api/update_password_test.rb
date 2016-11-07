require 'test_helper'

class UpdatePasswordTest < ActionDispatch::IntegrationTest
  test "updates a user's password" do
    post api_v1_update_password_path, json_request_data(
      email: "lyronctk@gmail.com",
      new_password: "newpassword"
    )

    expected_response = {
      'success' => true,
      'data' => {}
    }

    assert_response :success
    assert_equal 'application/json', response.content_type
    assert_equal(expected_response, JSON.parse(response.body))

    user = User.find_by(email: 'lyronctk@gmail.com')
    assert_equal user, user.authenticate('newpassword')
  end
end
