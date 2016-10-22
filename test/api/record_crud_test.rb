require 'test_helper'

class RecordCrudTest < ActionDispatch::IntegrationTest
  test "creates record" do
    record_attrs = {
      user_id: 2,
      schema: "shape",
      use_case: "survey1",
      record_data: "{'key': 'value'}"
    }
    record_data = {
      data: record_attrs,
      headers: {
        content_type: 'application/json'
      }
    }
    post api_v1_records_path, record_data

    last_record = Record.last
    assert_equal record_attrs, last_record.slice(record_attrs.keys)
    assert_not_nil record

    expected_response = {
      'success' => true,
      'data' => {'record_id'=> record.id}
    }
    assert_response :success
    assert_equal 'application/json', response.content_type
    assert_equal(expected_response, JSON.parse(response.body))
  end

  test "updates record" do
    request_data = {
      data: {
        record_id: 123,
        new_info: {
          schema: "newshape"
        }
      },
      headers: {
        content_type: 'application/json'
      }
    }
    patch api_v1_records_path, request_data
    assert_response :success
    record = Record.find_by(id: request_data[:data][:record_id])
    # assert_not_nil record
    assert_equal record[:schema], request_data[:data][:new_info][:schema]
  end

  test "deletes record" do
    record = Record.find(123)
    request_data = {
      headers: {
        content_type: 'application/json'
      }
    }
    delete api_v1_record_path(record), request_data
    assert_response :success
    assert_nil Record.find_by(id: record.id)
  end

  test "GET /records/:id" do
  end

  test "GET /records returns all records" do

  end

  test "GET /records?user_case= returns all records for use_case" do

  end

  # test "reads single record" do
  #   request_data = {
  #     data: {
  #       record_id: 123
  #     },
  #     headers: {
  #       content_type: 'application/json'
  #     }
  #   }
  #   get api_v1_records_path, request_data
  #   assert_response :success
  #   record = Record.find_by(id: request_data[:record_id])
  # end
end
