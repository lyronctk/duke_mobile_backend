class RecordTest < ActiveSupport::TestCase
  should validate_presence_of(:user_id)
  should validate_presence_of(:schema)
  should validate_presence_of(:data)
  should validate_presence_of(:use_case)
  
  should validate_uniqueness_of(:use_case)
end
