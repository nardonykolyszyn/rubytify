# frozen_string_literal: true

namespace :db do
  desc 'It loads predefined artists and retrieves albums and songs.'
  task :load_seed => :environment do
    require 'colorize'
    ARTISTS = YAML.load_file(Rails.root.join('config', 'seed.yml'))
                  .deep_symbolize_keys[:artists].map(&:to_s).freeze
    ARTISTS.each do |artist_name|
      puts "Retrieving information for #{artist_name}...".green
      operation_result = RegisterArtist.call(artist_name: artist_name)
      puts "Error: #{operation_result.error}".red if operation_result.failure?
      puts "Information has been retrieved".green if operation_result.success?
    end
  end
end
