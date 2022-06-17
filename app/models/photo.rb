# frozen_string_literal: true

class Photo < ApplicationRecord
  belongs_to :photo_gallery, inverse_of: :photos
  has_one_attached :image, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates(
    :image,
    attached: true,
    content_type: %r{\Aimage/.*\z},
    size:
      { less_than: 100.megabytes, message: 'is too large' }
  )
end
