# frozen_string_literal: true

module Api
  module V1
    # It returns all artists and their albums.
    class ArtistsController < ApiSitesController
      before_action :assign_resource, only: :albums

      def index
        artists_query = Artist.all.order(popularity: :desc)

        render json: {
          data: load_collection(artists_query)
        }, status: :ok
      end

      def albums
        albums_query = @artist.albums

        render json: {
          data: load_collection(albums_query)
        }, status: :ok
      end
    end
  end
end
