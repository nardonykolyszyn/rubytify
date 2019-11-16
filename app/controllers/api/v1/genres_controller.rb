# frozen_string_literal: true

module Api
  module V1
    # It returns a random song based in taken genre.
    class GenresController < ApiSitesController
      def random_song
        render json: {
          data: extract_song
        }, status: :ok
      end

      private

      def extract_song
        unless song.nil?
          return {
            name: song.name, spotify_url: song.href,
            preview_url: song.preview_url, explicit: song.explicit,
            duration_ms: song.duration_ms
          }
        end
        []
      end

      def song
        @song ||= RSpotify::Recommendations
                  .generate(seed_genres: [params[:genre_name]])
                  .tracks.first
      end
    end
  end
end
