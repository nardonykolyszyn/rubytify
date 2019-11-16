# frozen_string_literal: true

module Api
  module V1
    class ApiSitesController < ApplicationController
      private

      def assign_resource
        resource_name = controller_name.singularize
        resource = controller_name.classify.constantize.find(params[:id])
        instance_variable_set("@#{resource_name}", resource)
      end

      def set_collection(query)
        ActiveModelSerializers::SerializableResource.new(query)
      end
    end
  end
end
