class CreateSpreeTracks < ActiveRecord::Migration
  def change
    create_table :spree_tracks do |t|
      t.string :name

      t.timestamps
    end
  end
end
