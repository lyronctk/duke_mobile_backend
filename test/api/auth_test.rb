require 'test_helper'

class AuthTest < ActionDispatch::IntegrationTest

  # ruby -I"lib:test" test/api/record_crud_test.rb -n "test_DELETE_/record/:id"
	test "POST /authenticate with VALID credentials" do
		user = users(:lyron)
		post api_v1_authenticate_path, json_request_data({
        email: user.email,
        password: 'password'
    })
		assert_response :success
	end

	test "POST /authenticate with INVALID credentials" do
		post api_v1_authenticate_path, json_request_data({
        email: "blah@blah.com",
        password: "wrongpassword"
    })
		assert_json_failure(user: 'Invalid credentials')
	end

	test "POST /record with invalid & missing token" do
		request_data = {
      params: {
        data: { hello: 'world' }
      },
      headers: {
        content_type: 'application/json',
        Authorization: 'fake'
      }
    }
    post api_v1_records_path, request_data 
    assert_json_failure(auth: 'Invalid token')

   	request_data = {
      params: {
        data: {doesnt: 'matter'}
      },
      headers: {
        content_type: 'application/json'
      }
    }
    post api_v1_records_path, request_data 
    assert_json_failure(auth: 'Missing token')
	end
end