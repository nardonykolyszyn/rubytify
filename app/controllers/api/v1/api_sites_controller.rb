# frozen_string_literal: true

module Api
  module V1
    # Main API controller that provides common behaviors across subclasses.
    class ApiSitesController < ApplicationController
      before_action :assign_page

      def assign_page
        @page = params[:page] || 1
      end

      private

      def assign_resource
        resource_name = controller_name.singularize
        resource = controller_name.classify.constantize.find(params[:id])
        instance_variable_set("@#{resource_name}", resource)
      end

      def load_collection(query)
        ActiveModelSerializers::SerializableResource.new(query)
      end
    end
  end
end
