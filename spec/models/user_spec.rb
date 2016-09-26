require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    subject do
      User.new(
        first_name: 'Lyron',
        last_name: 'Co Ting Keh',
        password: 'test',
        email: 'lyronctk@gmail.com'
      )
    end
    it { should validate_uniqueness_of(:email) }
    it { should have_secure_password }
  end

  describe 'change password' do

  end
end

RSpec.describe('/api/v1/update_password') do
  describe 'POST' do
    it "updates a user's password" do
      request_data = {
        data: {
          email: "lyronctk@gmail.com"
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
      assert_equal request_data[:data][:password], user.password
    end
  end
end