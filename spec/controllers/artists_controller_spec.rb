# frozen_string_literal: true

require 'rails_helper'

describe 'return all artists', type: :request do
  before { get '/api/v1/artists' }

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns JSON as content type' do
    expect(response.content_type).to eq('application/json')
  end
end
