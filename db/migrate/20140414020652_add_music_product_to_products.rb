class AddMusicProductToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :music_product, :boolean
  end
end
