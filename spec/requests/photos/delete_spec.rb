# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Photos', type: :request do
  describe 'DELETE /delete' do
    User.destroy_all
    let!(:user) { create(:user) }
    let!(:photo_gallery) { create(:photo_gallery, user: user) }
    let!(:photo) { create(:photo, photo_gallery: photo_gallery) }

    context 'with valid id passed' do
      it 'deletes a photo and redirects to photos page' do
        delete photo_gallery_photo_path(photo_gallery, photo)
        expect(status).to eq(302)
        expect(response).to redirect_to(photo_gallery_photos_path)
        follow_redirect!
        expect(response).to render_template(:index)
      end
    end
  end
end
