# frozen_string_literal: true

module Api
  module V1
    class ArtistsController < ApiSitesController
      before_action :assign_resource, only: :albums
      
      def index
        @artists = ActiveModelSerializers::SerializableResource.new(Artist.all.order(popularity: :desc))

        render json: {
          data: @artists
        }, status: :ok
      end

      def albums
        render json: @artist and return
      end
    end
  end
end
