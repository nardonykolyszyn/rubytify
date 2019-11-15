# frozen_string_literal: true

class Artist < ApplicationRecord
  include SpotifyValidations
  ## Associations
  has_many :albums
end
