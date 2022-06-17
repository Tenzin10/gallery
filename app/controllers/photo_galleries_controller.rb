# frozen_string_literal: true

class PhotoGalleriesController < ApplicationController
  before_action :photo_gallery, only: %i[show edit update destroy]

  def index
    @photo_galleries = current_user.photo_galleries
  end

  def show; end

  def new
    @photo_gallery = PhotoGallery.new
  end

  def create
    @photo_gallery = current_user.photo_galleries.build(photo_gallery_params)
    if @photo_gallery.save
      respond_to do |format|
        format.html { redirect_to photo_galleries_path, notice: 'Gallery was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    render :edit
  end

  def update
    if @photo_gallery.update(photo_gallery_params)
      respond_to do |format|
        format.html { redirect_to photo_galleries_path, notice: 'Gallery was successfully updated.' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @photo_gallery.destroy
    respond_to do |format|
      format.html { redirect_to photo_galleries_path, notice: 'Gallery was successfully deleted.' }
    end
  end

  private

  def photo_gallery
    @photo_gallery = current_user.photo_galleries.find(params[:id])
  end

  def photo_gallery_params
    params.require(:photo_gallery).permit(:name, :description)
  end
end
