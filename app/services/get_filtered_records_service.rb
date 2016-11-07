class GetFilteredRecordsService < ApplicationService
  include ActiveAttr::Model
  attribute :user_id, type: Integer
  attribute :schema, type: String
  attribute :use_case, type: String

  def action
    records = Record.where(Hash[attributes.select { |_, value| value.present? }])
    Success.new(records: records)
  end
end
