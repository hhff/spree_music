class AddTypeToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :type, :string
  end
end
