# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, :last_name, presence: true

  has_many :photo_galleries, inverse_of: :user, dependent: :destroy
end
