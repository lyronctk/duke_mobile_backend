class AuthTest < ActionDispatch::IntegrationTest

	test "POST /authenticate with VALID credentials"
		user = users(:lyron)
		post api_v1_authenticate_path, json_request_data({
        email: user.email
        password: user.password_digest
    })
		assert_response :success
	end

	test "POST /authenticate with INVALID credentials"
		post api_v1_authenticate_path, json_request_data({
        email: "blah@blah.com"
        password: "wrongpassword"
    })
		assert_equal Failure.new(user: 'Invalid credentials').to_h, JSON.decode(response.body)
	end
end