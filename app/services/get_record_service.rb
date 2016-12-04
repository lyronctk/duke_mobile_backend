class GetRecordService < ApplicationService
	include ActiveAttr::Model
	attribute :record_id
  attribute :user

  def action
    record = Record.find(record_id)
    return Failure.new(errors: {user: 'Not authorized for access'}) unless user == record.user
    if record
      Success.new record_info: record.attributes
    else
      Failure.new
    end
  end
end