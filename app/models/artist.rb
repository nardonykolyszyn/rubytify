# frozen_string_literal: true

class Artist < ApplicationRecord
  ## Validations
  validates :spotify_id, uniqueness: true
  ## Associations
  has_many :albums
end
