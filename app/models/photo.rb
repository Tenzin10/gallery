class Photo < ApplicationRecord
  belongs_to :photo_gallery, inverse_of: :photos

  validates :name, presence: true, uniqueness: true

  has_one_attached :image
end
