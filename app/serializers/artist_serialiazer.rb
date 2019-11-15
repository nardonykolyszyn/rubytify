# frozen_string_literal: true

class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :genres, :popularity, :spotify_url
end
