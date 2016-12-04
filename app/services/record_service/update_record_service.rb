class UpdateRecordService < ApplicationService
  
  attribute :id
  attribute :schema
  attribute :use_case
  attribute :record_data
  attribute :user

  def action
    record = Record.find(id)
    return Failure.new(user: 'Not authorized for access') unless user == record.user
    record.attributes = attributes.select { |key, value| value.present?}
    if record.save
      Success.new
    else
      Failure.new record.errors
    end
  end
end
