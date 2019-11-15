# frozen_string_literal: true

module SpotifyValidations
  extend ActiveSupport::Concern

  included do
    ## Validations
    validates :spotify_id, uniqueness: true
  end
end
