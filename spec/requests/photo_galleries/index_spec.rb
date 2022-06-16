# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PhotoGalleries', type: :request do
  describe 'GET /index' do
    User.destroy_all
    let!(:user) { create(:user) }
    let!(:photo_galleries) { create_list(:photo_gallery, 10, user: user) }

    it 'lists all the galleries of current user' do
      get photo_galleries_path
      expect(status).to eq(200)
      expect(response).to render_template(:index)
      expect(response.body).to include(photo_galleries_path)
    end
  end
end
