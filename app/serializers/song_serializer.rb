# frozen_string_literal: true

class SongSerializer < ActiveModel::Serializer
  attributes %i[id name explicit duration_ms preview_url spotify_url].freeze
end