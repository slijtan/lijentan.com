class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :post_id, required: true
      t.string :quote, required: true
      t.string :source, required: false, default: nil
      t.string :type, required: true
      t.string :text_color, required: false, default: nil
      t.integer :text_size, required: false, default: nil
    end
  end
end
