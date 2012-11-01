class RemoveQuoteFieldsFromPost < ActiveRecord::Migration
  def up
    remove_column :posts, :quote
    remove_column :posts, :quote_source
    remove_column :posts, :text_color
  end

  def down
    add_column :posts, :quote, :string, required: false
    add_column :posts, :quote_source, :string, required: false
    add_column :posts, :text_color, :string, default: nil
  end
end
