class CreateSpreeArtists < ActiveRecord::Migration
  def change
    create_table :spree_artists do |t|
      t.string :name
    end
  end
end