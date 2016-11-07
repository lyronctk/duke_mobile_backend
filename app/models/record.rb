# == Schema Information
#
# Table name: records
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  schema      :string(255)      not null
#  use_case    :string(255)      not null
#  record_data :json             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_records_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_9ba3ba9afc  (user_id => users.id)
#

class Record < ActiveRecord::Base
  belongs_to :user

  validates :use_case, presence: true
  validates :schema, presence: true
  validates :user_id, presence: true
  validates :record_data, presence: true
end
