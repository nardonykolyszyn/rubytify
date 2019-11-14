# frozen_string_literal: true

class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :spotify_url
      t.string :preview_url
      t.string :duration_ms
      t.string :explicit
      t.string :spotify_id
      t.belongs_to :album, foreign_key: { on_delete: :cascade }, index: true

      t.timestamps
    end
  end
end
