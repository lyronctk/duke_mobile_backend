class GetAllRecordsService < ApplicationService

  def action
    begin
      Success.new(records: Record.all)
    rescue
      Failure.new
    end
  end
end