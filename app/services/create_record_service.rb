class CreateRecordService < ApplicationService
  include ActiveAttr::Model
  attribute :user_id, type: Integer
  attribute :schema, type: String
  attribute :use_case, type: String
  attribute :record_data, type: String

  def action
    record = Record.new(attributes)
    if record.save
      Success.new(record_id: record.id)
    else
      Failure.new(record.errors)
    end
  end
end