class CreateSpreeTours < ActiveRecord::Migration
  def change
    create_table :spree_tours do |t|
      t.string :name
    end
  end
end