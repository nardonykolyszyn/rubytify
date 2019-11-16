# frozen_string_literal: true

require 'rails_helper'

describe 'return a random song', type: :request do
  let(:default_params) { { format: :json } }
  let(:expected_keys) { %w[name spotify_url preview_url explicit duration_ms] }

  it 'returns a empty array when unknown genre' do
    get '/api/v1/genres/93279834743/random_song'
    expect(JSON.parse(response.body)['data']).to eq([])
  end

  it 'returns an random song when genre is valid' do
    get '/api/v1/genres/latin/random_song'
    expect(JSON.parse(response.body)['data'].keys).to eq(expected_keys)
  end
end
