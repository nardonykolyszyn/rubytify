# frozen_string_literal: true

module Api
  module V1
    # It returns all song for an album.
    class AlbumsController < ApiSitesController
      before_action :assign_resource, only: :songs

      def songs
        render json: {
          data: load_collection(@album.songs)
        }, status: :ok
      end
    end
  end
end
