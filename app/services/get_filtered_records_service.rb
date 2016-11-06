class GetFilteredRecordsService < ApplicationService
  include ActiveAttr::Model
  attribute :user_id, type: Integer
  attribute :schema, type: String
  attribute :use_case, type: String
  attribute :record_data, type: String

  def action
    begin
      records = Record.all
      attributes.each do |key, value|
        if value
          records = records.where(" #{key} = '#{value}' ")
        end
      end
      Success.new(records: records)
    rescue
      Failure.new
    end
  end
end