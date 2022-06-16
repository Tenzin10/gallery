require 'rails_helper'

RSpec.describe "Photos", type: :request do
  describe "PUT /update" do
    User.destroy_all
    let!(:user) { create(:user) }
    let!(:photo_gallery) { create(:photo_gallery, user: user) }
    let!(:photo) { create(:photo, photo_gallery: photo_gallery) }

    context 'with valid params' do
      it "updates a photo" do
        get edit_photo_gallery_photo_path(photo_gallery, photo)
        expect(response).to render_template(:edit)

        put photo_gallery_photo_path, params: {
          photo: {
            name: 'photo from yesterday',
            shooting_date: DateTime.yesterday
          }
        }
        expect(status).to eq(302)
        expect(response).to redirect_to(photo_gallery_photos_path(photo_gallery))
        follow_redirect!
        expect(response).to render_template(:_photo)
      end
    end

    context 'with invalid params' do
      it "throws an error" do
        get edit_photo_gallery_photo_path(photo_gallery, photo)
        expect(response).to render_template(:edit)

        put photo_gallery_photo_path, params: {
          photo: {
            name: nil,
            description: Faker::Lorem.paragraph,
            shooting_date: 3.days.ago,
            image: fixture_file_upload('image.jpeg')
          }
        }

        expect(status).to eq(422)
        expect(response).to render_template(:edit)
      end
    end
  end
end
