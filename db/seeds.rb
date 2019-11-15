# frozen_string_literal: true


# It loads artists seed file by combining IO and YAML.
# Deep symbolize is extended from ActiveSupport, it helps to
# implicitily convert string keys to symbols for performance purposes
ARTISTS = YAML.load_file('config/seed.yml').deep_symbolize_keys[:artists].map(&:to_s).freeze

ARTISTS.each do |artist_name|
  operation_result = RegisterArtist.call(
    artist_name: artist_name
  )
end
