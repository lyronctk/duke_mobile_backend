require 'test_helper'

class RegistrationsTest < ActionDispatch::IntegrationTest
  test "creates new user and sends confirmation email" do
    request_data = {
      data: {
        first_name: "Faraz",
        last_name: "Yashar",
        email: "faraz.yashar@gmail.com",
        password: "verysecurepassword"
      },
      headers: {
        content_type: 'application/json'
      }
    }

    post api_v1_registrations_path, request_data

    user = User.find_by!(email: request_data[:data][:email])
    assert_equal request_data[:data][:first_name], user.first_name

    expected_response = {
      'status' => 200,
      'success' => true,
      'data' => { 'user_id' => user.id }
    }

    assert_response :success
    assert_equal 'application/json', response.content_type
    assert_equal(expected_response, JSON.parse(response.body))
  end
end
