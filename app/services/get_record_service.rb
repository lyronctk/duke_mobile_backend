class GetRecordService < ApplicationService
	include ActiveAttr::Model
	attribute :record_id

  def action
    record = Record.find(record_id)
    if record
      Success.new(record_info: record.attributes)
    else
      Failure.new
    end
  end
end