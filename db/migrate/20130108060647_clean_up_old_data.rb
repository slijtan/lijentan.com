class CleanUpOldData < ActiveRecord::Migration
  def up
    drop_table :images
    drop_table :background_images
    drop_table :quotes

    remove_column :posts, :previous_post_id
  end

  def down
    create_table :images do |t|
      t.string :url, required: true
      t.integer :post_id, required: true
      t.integer :position, default: 1, required: true
    end

    create_table :background_images do |t|
      t.integer :post_id, :null => false
      t.string :url, :null => false
      t.string :type, :null => false
      t.boolean :tile, :null => false, :default => false
      t.integer :z_index, :null => false, :default => 1
    end

    create_table :quotes do |t|
      t.integer :post_id, required: true
      t.string :quote, required: true
      t.string :source, required: false, default: nil
      t.string :type, required: true
      t.string :text_color, required: false, default: nil
      t.integer :text_size, required: false, default: nil
    end

    add_column :posts, :previous_post_id, :integer, null: true, default: nil
  end
end
