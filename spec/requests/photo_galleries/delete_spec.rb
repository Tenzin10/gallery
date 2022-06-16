require 'rails_helper'

RSpec.describe "PhotoGalleries", type: :request do
  describe "PUT /update" do
    User.destroy_all
    let!(:user) { create(:user) }
    let!(:photo_gallery) { create(:photo_gallery, user: user) }

    context 'with valid id passed' do
      it "deletes a gallery and redirects to galleries page" do
        delete photo_gallery_path(photo_gallery)
        expect(status).to eq(302)
        expect(response).to redirect_to(photo_galleries_path)
        follow_redirect!
        expect(response).to render_template(:index)
      end
    end
  end
end
