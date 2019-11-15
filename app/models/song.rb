# frozen_string_literal: true

class Song < ApplicationRecord
  include SpotifyValidations
  ## Associations
  belongs_to :album
end
