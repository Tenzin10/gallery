# frozen_string_literal: true

class PhotosController < ApplicationController
  before_action :photo, only: %i[show edit update destroy]

  def index
    @photos = photo_gallery.photos
  end

  def new
    @photo_gallery = photo_gallery
  end

  def create
    @photo = photo_gallery.photos.build(photo_params)
    if @photo.save
      respond_to do |format|
        format.html { redirect_to photo_gallery_photos_path(photo_gallery), notice: 'Photo was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    render :edit
  end

  def update
    if @photo.update(photo_params)
      respond_to do |format|
        format.html { redirect_to photo_gallery_photos_path(photo_gallery), notice: 'Photo was successfully updated.' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photo_gallery_photos_path(photo_gallery), notice: 'Photo was successfully deleted.' }
    end
  end

  private

  def photo_gallery
    @photo_gallery ||= current_user.photo_galleries.find(params[:photo_gallery_id])
  end

  def photo
    @photo ||= photo_gallery.photos.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:name, :description, :shooting_date, image: [])
  end
end
