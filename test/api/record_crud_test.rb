require 'test_helper'

class RecordCrudTest < ActionDispatch::IntegrationTest
  test "creates record" do
  	record_data = {
  		data: {
  		  user_id: 1,
  		  schema: "shape",
  		  use_case: "survey1",
  		  record_data: "{'key': 'value'}"
  		},
  		headers: {
  		  content_type: 'application/json'
  		}
  	}
  	post api_v1_records_path, record_data
  	record = Record.find_by(use_case: record_data[:data][:use_case])
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
    record = Record.find_by(id: request_data[:record_id])
    assert_not_nil record
    assert_equal record[:schema], request_data[:new_info][:schema]
  end

  test "deletes record" do
  	request_data = {
  		data: {
  			record_id: 123
  		},
  		headers: {
  			content_type: 'application/json'
  		}
  	}
  	delete api_v1_records_path, request_data
  	assert_response :success
  	assert_nil Record.find_by(id: @record_id)
  end

  # test "reads single record" do
  # 	request_data = {
  # 		data: {
  # 			record_id: 123
  # 		},
  # 		headers: {
  # 			content_type: 'application/json'
  # 		}
  # 	}
  # 	get api_v1_records_path, request_data
  # 	assert_response :success
  # 	record = Record.find_by(id: request_data[:record_id])
  # end
end
