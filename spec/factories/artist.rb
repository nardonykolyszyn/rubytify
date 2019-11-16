# frozen_string_literal: true

FactoryBot.define do
  factory :artist do
    name { 'Dust in the wind' }
    spotify_url { ''}
    preview_url { '' }
    duration_ms { 0 }
    explicit { false }
    spotify_id { '' }
  end
end
