class DeleteRecordService < ApplicationService
  
	attribute :record_id
  attribute :user

  def action
    record = Record.find(record_id)
    return Failure.new(user: 'Not authorized for access') unless user == record.user
    if record.delete
      Success.new
    else
      Failure.new
    end
  end
end