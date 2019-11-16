# frozen_string_literal: true

class AlbumSerializer < ActiveModel::Serializer
  attributes %i[id name image total_tracks spotify_url spotify_id songs].freeze

  def songs
    ActiveModelSerializers::SerializableResource.new(object.songs)
  end
end
