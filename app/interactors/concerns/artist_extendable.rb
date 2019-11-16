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

  def extract_albums(albums)
    album_parameters = []

    albums.each do |album|
      album_parameters.push(name: album.name, total_tracks: album.total_tracks,
                            image: album.images[0]['url'], spotify_id: album.id,
                            spotify_url: album.href, tracks: album.tracks)
    end
    
    album_parameters
  end

  def extract_songs(songs)
    song_parameters = []
    songs.each do |song|
      song_parameters.push(name: song.name, preview_url: song.preview_url,
                           duration_ms: song.duration_ms, spotify_id: song.id,
                           spotify_url: song.href, explicit: song.explicit)
    end

    song_parameters
  end
end
