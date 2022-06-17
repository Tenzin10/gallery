require 'rails_helper'

RSpec.describe PhotoGallery, type: :model do
  let!(:user) { create(:user) }
  subject do
    described_class.new(
      name: "Anything",
      description: "Lorem ipsum",
      user: user
    )
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:description) }
  end

  describe 'Associations' do
    it { should belong_to(:user).inverse_of(:photo_galleries) }
    it { should have_many(:photos).inverse_of(:photo_gallery).dependent(:destroy) }
  end
end
