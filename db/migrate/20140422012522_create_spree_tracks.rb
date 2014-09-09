class CreateSpreeTracks < ActiveRecord::Migration
  def change
    create_table :spree_tracks do |t|
      t.string :name
      t.string :isrc
      t.integer :duration
      t.integer :position
      t.references :release

      t.string :audio_file_name
      t.string :audio_content_type
      t.integer :audio_file_size
      t.datetime :audio_updated_at

      t.timestamps
    end
  end
end
