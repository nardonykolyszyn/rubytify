# frozen_string_literal: true

class RegisterArtist < ApplicationInteractor
  include ArtistExtendable

  def call
    response
    not_found if response.nil?
    assign_albums
    persist_record(record: artist,
                   resource_name: :artist,
                   params: set_artist_attributes)
  end

  protected

  def assign_albums
    artist_albums = extract_albums(albums)
    artist_albums.each do |album|
      artist.albums.build(album.except(:tracks))
      songs = extract_songs(album[:tracks])
      songs.each { |song| artist.albums.last.songs.build(song) }
    end
  end

  private

  def artist
    @artist ||= Artist.new
  end

  def response
    @response ||= RSpotify::Artist.search(context.artist_name).first
  end

  # NOTE: Because Spotify's API returns repeated albums with different ids.
  def albums
    @albums ||= response.albums.uniq(&:name)
  end
end
