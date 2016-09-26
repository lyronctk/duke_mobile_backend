RSpec.describe('/api/v1/update_password') do
  describe 'POST' do
    it "updates a user's password" do
      User.create!(
        first_name: 'Lyron',
        last_name: 'CTK',
        email: 'lyronctk@gmail.com',
        password: 'xxxxxxx'
      )

      request_data = {
        data: {
          email: "lyronctk@gmail.com",
          new_password: "newpassword"
        },
        headers: {
          content_type: 'application/json'
        }
      }

      post api_v1_update_password_path, request_data

      expected_response = {
        'status' => 200,
        'success' => true,
        'data' => {}
      }

      assert_response :success
      assert_equal 'application/json', response.content_type
      assert_equal(expected_response, JSON.parse(response.body))

      user = User.find_by(email: request_data[:data][:email])
      assert_equal user, user.authenticate('newpassword')
    end
  end
end
