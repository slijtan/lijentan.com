class UpdateVideosToNewSchema < ActiveRecord::Migration
  def up
    remove_column :videos, :post_id
    remove_column :videos, :position
    add_column :videos, :style, :string, required: true
  end

  def down
    add_column :videos, :post_id, :integer, required: true
    add_column :videos, :position, :integer, required: true, default: 1
    remove_column :videos, :style
  end
end
