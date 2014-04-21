class CreateMetadata < ActiveRecord::Migration
  def change
    create_table :spree_metadata do |t|
      t.string :name
      t.string :isrc
      t.string :upc
      t.references :track

      t.timestamps
    end
  end
end
