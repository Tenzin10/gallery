require 'rails_helper'

RSpec.describe "Photos", type: :request do
  describe "POST /create" do
    User.destroy_all
    let!(:user) { create(:user) }
    let!(:photo_gallery) { create(:photo_gallery, user: user) }

    context 'with valid params' do
      it "creates a photo in the gallery" do
        get new_photo_gallery_photo_path(photo_gallery)
        expect(response).to render_template(:new)

        post photo_gallery_photos_path, params: {
          photo: {
            name: Faker::ProgrammingLanguage.name,
            description: Faker::Lorem.paragraph,
            shooting_date: 3.days.ago,
            image: fixture_file_upload('image.jpeg')
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
        get new_photo_gallery_photo_path(photo_gallery)
        expect(response).to render_template(:new)

        post photo_gallery_photos_path, params: {
          photo: {
            description: Faker::Lorem.paragraph,
            shooting_date: 3.days.ago,
            image: fixture_file_upload('image.jpeg')
          }
        }

        expect(status).to eq(422)
        expect(response).to render_template(:new)
      end
    end
  end
end
