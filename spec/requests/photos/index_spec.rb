# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Photos', type: :request do
  describe 'GET /index' do
    User.destroy_all
    let!(:user) { create(:user) }
    let!(:photo_gallery) { create(:photo_gallery, user: user) }
    let!(:photos) { create_list(:photo, 10, photo_gallery: photo_gallery) }

    it 'lists all the photos of current gallery' do
      get photo_gallery_photos_path(photo_gallery)
      expect(status).to eq(200)
      expect(response).to render_template(:index)
    end
  end
end
