class Record < ActiveRecord::Base
  belongs_to :user

  validates :use_case,
    presence: true,
    uniqueness: true
  validates :schema, presence: true
  validates :user_id, presence: true
  validates :record_data, presence: true
end
