# frozen_string_literal: true

module Api
  module V1
    # It returns all artists and their albums.
    class ArtistsController < ApiSitesController
      before_action :assign_resource, only: :albums

      def index
        artists_query = Artist.all
                              .order(popularity: :desc)
                              .paginate(page: @page, per_page: 15)

        render json: {
          data: load_collection(artists_query),
          current_page: @page,
          total_pages: artists_query.total_pages,
          total_entries: artists_query.total_entries
        }, status: :ok
      end

      def albums
        albums_query = @artist.albums
                              .paginate(page: @page, per_page: 15)

        render json: {
          data: load_collection(albums_query),
          current_page: @page,
          total_pages: albums_query.total_pages,
          total_entries: albums_query.total_entries
        }, status: :ok
      end
    end
  end
end
