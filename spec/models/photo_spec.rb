require 'rails_helper'

RSpec.describe Photo, type: :model do
  let!(:user) { create(:user) }
  let!(:photo_gallery) { create(:photo_gallery, user: user) }
  subject do
    described_class.new(
      name: Faker::Commerce.name,
      description: Faker::Lorem.sentence,
      shooting_date: DateTime.current,
      photo_gallery: photo_gallery,
      image: fixture_file_upload('image.jpeg')
    )
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_attached_of(:image) }
    it do
      should
      validate_content_type_of(:image)
        .allowing('image/jpeg', 'image/bmp', 'image/tiff', 'image/svg+xml', 'image/png', 'image/gif')
    end
  end

  describe 'Associations' do
    it { should belong_to(:photo_gallery).inverse_of(:photos) }
  end
end
