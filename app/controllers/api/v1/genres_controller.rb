# frozen_string_literal: true

module Api
  module V1
    # It returns a random song based in taken genre.
    class GenresController < ApiSitesController
      def random_song
        render json: {
          data: {
            name: song.name,
            spotify_url: song.href,
            preview_url: song.preview_url,
            duration_ms: song.duration_ms,
            explicit: song.explicit
          }
        }, status: :ok
      end

      private


      def song
        @song ||= RSpotify::Recommendations
                  .generate(seed_genres: [params[:genre_name]])
                  .tracks.first
      end
    end
  end
end
