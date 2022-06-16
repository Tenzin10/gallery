class PhotoGallery < ApplicationRecord
  belongs_to :user, inverse_of: :photo_galleries
  has_many :photos, inverse_of: :photo_gallery, dependent: :destroy

  validates :name, :description, presence: true
end