class CreateSpreeEvents < ActiveRecord::Migration
  def change
    create_table :spree_events do |t|
      t.string :name
    end
  end
end