require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )
  end

  describe 'Associations' do
    it { should have_many(:photo_galleries).inverse_of(:user).dependent(:destroy) }
  end
end
