# frozen_string_literal: true

require 'colorize'

# It loads artists seed file by combining IO and YAML.
# Deep symbolize is extended from ActiveSupport, it helps to
# implicitily convert string keys to symbols for performance purposes
ARTISTS = YAML.load_file('config/seed.yml').deep_symbolize_keys[:artists].map(&:to_s).freeze

ARTISTS.each do |artist_name|
  puts "Retrieving information for #{artist_name}...".green
  operation_result = RegisterArtist.call(
    artist_name: artist_name
  )

  puts "Error: #{operation_result.error}".red if operation_result.failure?
  puts 'Information has been retrieved'.green if operation_result.success?
end
