# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PhotoGalleries', type: :request do
  describe 'POST /create' do
    context 'with valid params' do
      it 'creates a Gallery and redirects to Galleries page' do
        get new_photo_gallery_path
        expect(response).to render_template(:new)

        post photo_galleries_path, params: {
          photo_gallery: { name: Faker::ProgrammingLanguage.name, description: Faker::Lorem.paragraph }
        }
        expect(status).to eq(302)
        expect(response).to redirect_to(photo_galleries_path)
        follow_redirect!
        expect(response).to render_template(:_photo_gallery)
      end
    end

    context 'with invalid params' do
      it 'throws an error' do
        get new_photo_gallery_path
        expect(response).to render_template(:new)

        post photo_galleries_path, params: {
          photo_gallery: { name: nil, description: Faker::Lorem.paragraph }
        }

        expect(status).to eq(422)
        expect(response).to render_template(:new)
      end
    end
  end
end
