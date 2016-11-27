class GetRecordsService < ApplicationService
  include ActiveAttr::Model
  attribute :schema
  attribute :use_case

  def action
    records = Record.where(Hash[attributes.select { |_, value| value.present? }])
    Success.new(records: records)
  end
end