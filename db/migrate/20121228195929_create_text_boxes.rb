class CreateTextBoxes < ActiveRecord::Migration
  def up
    create_table :text_boxes do |t|
      t.text :text
      t.string :style, default: 'full-margins'
      t.string :bg_color, default: nil
      t.integer :text_size, default: nil
      t.string :text_color, default: nil
    end

    remove_column :posts, :body
    remove_column :posts, :type
    remove_column :posts, :quote
    remove_column :posts, :quote_source
  end

  def down
    add_column :posts, :body, :text
    add_column :posts, :type, :string, required: true
    add_column :posts, :quote, :text, required: false
    add_column :posts, :quote_source, :string, required: false
    drop_table :text_boxes
  end
end
