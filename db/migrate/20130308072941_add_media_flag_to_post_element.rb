class AddMediaFlagToPostElement < ActiveRecord::Migration
  def change
    add_column :post_elements, :media_flag, :integer, default: 0, null: false
  end
end
