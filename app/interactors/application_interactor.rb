# frozen_string_literal: true

class ApplicationInteractor
  include Interactor

  # It does not provide the "call" method for its subclasses, it can be overwritten.
  def call
    raise NotImplementedError
  end

  private

  def success_response(record)
    context.data = record
  end

  def not_found
    context.fail!(error: 'This artist does not exist')
  end

  def persist_record(record: nil, resource_name: '', params: {})
    persisted_resource = retrieve_resource(resource_name, params[:spotify_id])
    if persisted_resource.blank?
      record.assign_attributes(params)
      record.save ? success_response(record) : context.fail!(error: record.errors.to_s)
    else
      context.data = persisted_resource
    end
  end

  def retrieve_resource(resource_name, spotify_id)
    resource_name.to_s.capitalize
                 .constantize.find_by(spotify_id: spotify_id)
  end
end
