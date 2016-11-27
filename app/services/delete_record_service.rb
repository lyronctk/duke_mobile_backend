class DeleteRecordService < ApplicationService
	include ActiveAttr::Model
	attribute :record_id

  def action
    record = Record.find(record_id)
    if record.delete
      Success.new
    else
      Failure.new
    end
  end
end