class GetRecordService < ApplicationService

  def action
    record = Record.find_by(id: request_info[:record_id])
    if record
      Success.new(record_info: record.attributes)
    else
      Failure.new
    end
  end
end