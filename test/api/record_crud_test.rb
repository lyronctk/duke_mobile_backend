require 'test_helper'

class RecordCrudTest < ActionDispatch::IntegrationTest

  test "POST /record" do
    record_attrs = {
      "user_id" => 1,
      "schema" => "shape",
      "use_case" => "survey1",
      "record_data" => {'favorite color'=>'pink'}.to_json
    }
    record_data = {
      data: record_attrs,
      headers: {
        content_type: 'application/json'
      }
    }
    post api_v1_records_path, record_data

    last_record = Record.last
    assert_not_nil last_record
    assert_equal record_attrs.except("record_data"), last_record.slice(:user_id, :schema, :use_case, :record_data).except("record_data")

    expected_response = {
      'success' => true,
      'data' => {'record_id'=> last_record.id}
    }
    assert_response :success
    assert_equal 'application/json', response.content_type
    assert_equal(expected_response, JSON.parse(response.body))
  end
  focus  
  test "PATCH /record/:id" do
    request_data = {
      data: {
        schema: "newshape"  
      },
      headers: {
        content_type: 'application/json'
      }
    }
    put api_v1_record_path(123), request_data

    assert_response :success
    record = Record.find_by(id: 123)
    assert_not_nil record
    assert_equal request_data[:data][:schema], record[:schema]
  end

  test "DELETE /record/:id" do
    record = Record.find_by(id: 123)
    assert_not_nil record

    delete api_v1_record_path(record)
    assert_response :success
    assert_nil Record.find_by(id: 123)
  end

  test "GET /records/:id" do
    record = Record.find_by(id: 123)
    assert_not_nil record
    expected_response = record.slice(:id, :user_id, :schema, :use_case, :record_data).merge({
      success: true
    })
    get api_v1_record_path(record)
    assert_equal expected_response, JSON.parse(response.body)
  end

  test "GET /records returns all records" do
    get api_v1_records_path
    concrete_data = {
      user_id: 1,
      schema: "circle",
      record_data: {"question1"=>"answer1", "question2"=>"answer2"}.to_json
    }
    expected_first = concrete_data.merge({
        id: 110, 
        use_case: "firstusecase"
    })
    expected_last = concrete_data.merge({
        id: 123, 
        use_case: "secondusecase"
    })
    assert_response :success
    assert_equal expected_first, JSON.parse(response.body).first
    assert_equal expected_last, JSON.parse(response.body).last
  end

  test "GET /records?use_case=firstusecase returns all records for use_case" do
    request_data = {
      data: {
        use_case: "secondusecase",
        user_id: 3  
      },
      headers: {
        content_type: 'application/json'
      }
    }
    get api_v1_filter_records_path, request_data
    concrete_data = {
      user_id: 3,
      use_case: "secondusecase",
      schema: "circle",
      record_data: {"question1"=>"answer1", "question2"=>"answer2"}.to_json
    }
    expected_first = concrete_data.merge({
      id: 115
    })
    expected_last = concrete_data.merge({
      id: 118
    })
    assert_response :success
    assert_equal expected_first, JSON.parse(response.body).first
    assert_equal expected_last, JSON.parse(response.body).last
  end
end
