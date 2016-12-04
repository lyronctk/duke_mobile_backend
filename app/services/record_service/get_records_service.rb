class GetRecordsService < ApplicationService
	
  attribute :schema
  attribute :use_case
  attribute :user

  def action
    records = Record.where(Hash[attributes.select { |_, value| value.present? }])
    Success.new records: records
  end
end
