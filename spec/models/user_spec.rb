require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    subject do
      User.new(
        first_name: 'Lyron',
        last_name: 'Co Ting Keh',
        password: 'test',
        email: 'lyronctk@gmail.com'
      )
    end
    it { should validate_uniqueness_of(:email) }
    it { should have_secure_password }
  end
end
