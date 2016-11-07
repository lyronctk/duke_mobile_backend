# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)      not null
#  last_name       :string(255)      not null
#  password_digest :string(255)      not null
#  email           :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

# A user in the application
class User < ActiveRecord::Base
  validates :email,
    presence: true,
    uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_secure_password
end
