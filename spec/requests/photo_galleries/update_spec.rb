require 'rails_helper'

RSpec.describe "PhotoGalleries", type: :request do
  describe "PUT /update" do
    User.destroy_all
    let!(:user) { create(:user) }
    let!(:photo_gallery) { create(:photo_gallery, user: user) }

    context 'with valid params' do
      it "update a gallery and redirects to galleries page" do
        get edit_photo_gallery_path(photo_gallery)
        expect(response).to render_template(:edit)

        put photo_gallery_path(photo_gallery), params: {
          photo_gallery: { name: 'my gallery' }
        }

        expect(status).to eq(302)
        expect(response).to redirect_to(photo_galleries_path)
        follow_redirect!
        expect(response).to render_template(:_photo_gallery)
      end
    end

    context 'with invalid params' do
      it "throws an error" do
        get edit_photo_gallery_path(photo_gallery)
        expect(response).to render_template(:edit)

        put photo_gallery_path(photo_gallery), params: {
          photo_gallery: { name: nil, description: Faker::Lorem.paragraph }
        }

        expect(status).to eq(422)
        expect(response).to render_template(:edit)
      end
    end
  end
end
