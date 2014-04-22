class CreateSpreeTracks < ActiveRecord::Migration
  def change
    create_table :spree_tracks do |t|
      t.string :name
      t.string :isrc
      t.integer :duration
      t.integer :position
      t.references :product

      t.timestamps
    end
  end
end
