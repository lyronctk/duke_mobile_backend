class UpdateRecordService < ApplicationService
  include ActiveAttr::Model
  attribute :id
  attribute :user_id
  attribute :schema
  attribute :use_case
  attribute :record_data

  def action
    record = Record.find(id)
    record.attributes = attributes
    if record.save
      Success.new
    else
      Failure.new(record.errors)
    end
  end
end
