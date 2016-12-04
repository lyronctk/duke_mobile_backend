require 'test_helper'

class RecordCrudTest < ActionDispatch::IntegrationTest

  test "POST /record" do
    record_attrs = {
      schema: "shape",
      use_case: "survey1",
      record_data: {
        favorite_color: 'pink'
      }
    }
    post api_v1_records_path, auth_request_data(users(:lyron), record_attrs)

    last_record = Record.last
    assert_equal stringify_keys_recursively!(record_attrs.merge(user: users(:lyron))),
      last_record.slice(:user, :schema, :use_case, :record_data)
      
    assert_json_success(record_id: last_record.id)
  end

  test "PUT /record/:id" do
    schema = "newshape"

    #wrong user
    put api_v1_record_path(123), auth_request_data(users(:lyron), schema: schema)

    record = Record.find_by(id: 123)
    assert_not_equal schema, record[:schema]
    assert_json_failure('Not authorized for access')

    #correct user
    put api_v1_record_path(123), auth_request_data(users(:faraz), schema: schema)
    assert_json_success
    record = Record.find_by(id: 123)
    assert_equal schema, record[:schema]
  end

  test "DELETE /record/:id" do
    record = Record.find_by(id: 123)

    delete api_v1_record_path(record), auth_request_data(users(:lyron), nil)
    assert_json_failure('Not authorized for access')
    assert_not_nil Record.find_by(id: 123)

    delete api_v1_record_path(record), auth_request_data(users(:faraz), nil)
    assert_json_success
    assert_nil Record.find_by(id: 123)
  end

  test "GET /records/:id" do
    get api_v1_record_path(123), auth_request_data(users(:lyron), nil)
    assert_json_failure('Not authorized for access')

    get api_v1_record_path(123), auth_request_data(users(:faraz), nil)
    assert_json_success(record_info: records(:record123).attributes)
  end

  test "GET /records" do
    get api_v1_records_path, auth_request_data(users(:faraz), nil)
    assert_response :success

    all_records = JSON.parse(response.body)["data"]["records"]
    assert_equal records(:record122).attributes, all_records.first
    assert_equal records(:record123).attributes, all_records.last
  end

  test "GET /records?use_case=secondusecase" do
    get api_v1_records_path, auth_request_data(users(:faraz), use_case: "secondusecase")
    assert_response :success

    all_records = JSON.parse(response.body)["data"]["records"]
    assert_equal records(:record122).attributes, all_records.first
    assert_equal all_records.count, 1
  end
end
