# frozen_string_literal: true

class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :image
      t.string :spotify_url
      t.string :total_tracks
      t.string :spotify_id
      t.belongs_to :artist, foreign_key: { on_delete: :cascade }, index: true

      t.timestamps
    end
  end
end
