# frozen_string_literal: true

module Api
  module V1
    class ArtistsController < ApiSitesController
      def index
        @artists = ActiveModelSerializers::SerializableResource.new(Artist.all.order(popularity: :desc))

        render json: {
          data: @artists
        }, status: :ok
      end
    end
  end
end
