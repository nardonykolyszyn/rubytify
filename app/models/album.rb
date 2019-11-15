# frozen_string_literal: true

class Album < ApplicationRecord
  include SpotifyValidations
  ## Associations
  belongs_to :artist
end
