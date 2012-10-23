class AddTextColorToPost < ActiveRecord::Migration
  def change
    add_column :posts, :text_color, :string, default: nil
  end
end
