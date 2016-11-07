require 'test_helper'

class RegistrationsTest < ActionDispatch::IntegrationTest
  focus
  test "creates new user and sends confirmation email" do
    email = "faraz.yashar2@gmail.com"
    last_name = "Yashar2"

    post api_v1_registrations_path, json_request_data(
      first_name: "Faraz",
      last_name: last_name,
      email: email,
      password: "verysecurepassword"
    )

    user = User.find_by!(email: email)
    assert_equal last_name, user.last_name

    assert_json_success(user_id: user.id)
  end
end
