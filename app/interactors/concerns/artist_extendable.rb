# frozen_string_literal: true

module ArtistExtendable
  extend ActiveSupport::Concern

  included do
    ## Setters methods
    def set_artist_attributes
      {
        name: response.name,
        image: response.images.first['url'],
        genres: response.genres,
        popularity: response.popularity,
        spotify_url: response.href,
        spotify_id: response.id
      }
    end
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
end
