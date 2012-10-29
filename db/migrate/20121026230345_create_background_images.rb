class CreateBackgroundImages < ActiveRecord::Migration
  def change
    create_table :background_images do |t|
      t.integer :post_id, :null => false
      t.string :url, :null => false
      t.string :type, :null => false
      t.boolean :tile, :null => false, :default => false
      t.integer :z_index, :null => false, :default => 1
    end
  end
end
