  ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/reporters'
Minitest::Reporters.use!

module ActiveSupport
  class TestCase
    # Note: You'll currently still have to declare fixtures explicitly in integration tests
    # -- they do not yet inherit this setting
    fixtures :all

    def json_request_data(data)
      {
        params: {
          data: data
        },
        headers: {
          content_type: 'application/json'
        }
      }
    end

    def stringify_keys_recursively!(input)
      case input
      when Array
        input.each { |el| stringify_keys_recursively!(el) }
      when Hash
        input.stringify_keys!
        stringify_keys_recursively!(input.values)
      end
      input
    end

    def assert_json_success(expected_data)
      expected_response = {
        success: true,
        data: expected_data
      }

      stringify_keys_recursively!(expected_response)
      assert_equal(expected_response, JSON.decode(response.body))
      assert_response :success
      assert_equal 'application/json', response.content_type
    end
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
    with.library :rails
  end
end
