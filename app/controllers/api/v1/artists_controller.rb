# frozen_string_literal: true

module Api
  module V1
    class ArtistsController < ApiSitesController
      before_action :assign_resource, only: :albums
      
      def index
        collection = ActiveModelSerializers::SerializableResource.new(Artist.all.order(popularity: :desc))

        render json: {
          data: collection
        }, status: :ok
      end

      def albums
        render json: @artist and return
      end
    end
  end
end
