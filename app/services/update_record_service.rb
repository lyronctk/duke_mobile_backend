class UpdateRecordService < ApplicationService
  include ActiveAttr::Model
  attribute :user_id, type: Integer
  attribute :schema, type: String
  attribute :use_case, type: String
  attribute :record_data, type: String

  def action
    record = Record.find_by(id: request_info[:record_id])
    attributes.each do |key, value|
      if(value)
        record[key] = value
      end
    end
    
    if record.save
      Success.new
    else
      Failure.new(record.errors)
    end
  end
end