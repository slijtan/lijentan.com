class ChangeMinHeightFromPosts < ActiveRecord::Migration
  def up
    add_column :posts, :height, :string, default: nil, null: true
    remove_column :posts, :min_height

    remove_column :posts, :style
  end

  def down
    add_column :posts, :min_height, :string, default: nil, null: true
    remove_column :posts, :height

    add_column :posts, :style, :string, required: false
  end
end
