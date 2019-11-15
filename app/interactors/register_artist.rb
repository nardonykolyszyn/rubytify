# frozen_string_literal: true

class RegisterArtist < ApplicationInteractor
  def call
    response
    assign_albums
    response.nil? ? not_found : persist_record(record: artist, resource_name: :artist, params: set_attributes)
  end

  protected

  def assign_albums
    artist_albums = extract_albums
    artist_albums.each { |album| artist.albums.build(album) }
  end

  def extract_albums
    album_parameters = []

    albums.each do |album|
      album_parameters.push(
        {
          name: album.name,
          total_tracks: album.total_tracks,
          image: album.images[0]['url'],
          spotify_id: album.id,
          spotify_url: album.href
        }
      )
    end

    album_parameters
  end

  private

  # FIXME: Set attributes dinamically
  def set_attributes
    {
      name: response.name,
      image: response.images.first["url"],
      genres: response.genres,
      popularity: response.popularity,
      spotify_url: response.href,
      spotify_id: response.id
    }
  end

  # NOTE: Lazy loading implementation.
  def artist
    @artist ||= Artist.new
  end
  
  # FIXME: Improve this lazy loading.
  def response
    @response ||= RSpotify::Artist.search(context.artist_name).first
  end

  def albums
    @albums ||= response.albums
  end
end
