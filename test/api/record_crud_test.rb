require 'test_helper'

class RecordCrudTest < ActionDispatch::IntegrationTest

  test "POST /record" do
    user = users(:lyron)
    record_attrs = {
      user_id: user.id,
      schema: "shape",
      use_case: "survey1",
      record_data: {
        favorite_color: 'pink'
      }
    }
    post api_v1_records_path, json_request_data(record_attrs)

    last_record = Record.last
    assert_equal stringify_keys_recursively!(record_attrs),
      last_record.slice(:user_id, :schema, :use_case, :record_data)

    assert_json_success(record_id: last_record.id)
  end

  test "PATCH /record/:id" do
    schema = "newshape"

    put api_v1_record_path(123), json_request_data(schema: schema)

    assert_response :success
    record = Record.find_by(id: 123)
    assert_not_nil record
    assert_equal schema, record[:schema]
  end

  test "DELETE /record/:id" do
    record = Record.find_by(id: 123)
    assert_not_nil record

    delete api_v1_record_path(record)
    assert_response :success
    assert_nil Record.find_by(id: 123)
  end

  test "GET /records/:id" do
    get api_v1_record_path(123)
    assert_response :success
    assert_equal records(:record123).attributes, JSON.parse(response.body)["data"]["record_info"]
  end

  test "GET /records" do
    get api_v1_records_path
    assert_response :success

    all_records = JSON.parse(response.body)["data"]["records"]
    assert_equal records(:record120).attributes, all_records.first
    assert_equal records(:record123).attributes, all_records.last
  end

  test "GET /records?use_case=secondusecase" do
    get api_v1_records_path, json_request_data(use_case: "secondusecase")
    assert_response :success

    all_records = JSON.parse(response.body)["data"]["records"]
    assert_equal records(:record121).attributes, all_records.first
    assert_equal records(:record122).attributes, all_records.last
  end
end
