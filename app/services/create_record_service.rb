class CreateRecordService < ApplicationService
  include ActiveAttr::Model
  attribute :user_id
  attribute :schema
  attribute :use_case
  attribute :record_data

  def action
    record = Record.new(attributes)
    if record.save
      Success.new(record_id: record.id)
    else
      Failure.new(record.errors)
    end
  end
end
