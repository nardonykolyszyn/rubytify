# frozen_string_literal: true

require 'rails_helper'

describe 'return a random song', type: :request do
  let(:default_params) { {format: :json} }

  it 'return a empty array when unknown genre' do
    get '/api/v1/genres/93279834743/random_song'
    expect(JSON.parse(response.body)['data']).to eq([])
  end
end
