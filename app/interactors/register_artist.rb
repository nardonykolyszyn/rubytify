# frozen_string_literal: true

class RegisterArtist < ApplicationInteractor
  def call
    response
    response.nil? ? not_found : persist_record(:artist, set_attributes)
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
    @artist ||= context.artist
  end
  
  # FIXME: Improve this lazy loading.
  def response
    @response ||= RSpotify::Artist.search(artist).first
  end
end
