class DeleteRecordService < ApplicationService

  def action
    record = Record.find_by(id: request_info[:record_id])
    if record.delete
      Success.new
    else
      Failure.new
    end
  end
end