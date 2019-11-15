# frozen_string_literal: true

module Api
  module V1
    class AlbumsController < ApiSitesController
      def songs
        collection = ActiveModelSerializers::SerializableResource.new(@album.songs)

        render json: {
          data: collection
        }, status: :ok
      end      
    end
  end
end
