# frozen_string_literal: true

class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :total_tracks, :spotify_url, :spotify_id, :songs

  def songs
    ::SongSerializer.new(object.songs)
  end
end
