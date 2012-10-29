class RemoveBackgroundImagesFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :bg_img_fixed
    remove_column :posts, :bg_img_shift_down_1
    remove_column :posts, :bg_img_shift_down_2
  end

  def down
    add_column :posts, :bg_img_fixed, :string, required: false
    add_column :posts, :bg_img_shift_down_1, :string, required: false
    add_column :posts, :bg_img_shift_down_2, :string, required: false
  end
end
