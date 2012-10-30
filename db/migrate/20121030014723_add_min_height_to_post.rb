class AddMinHeightToPost < ActiveRecord::Migration
  def change
    add_column :posts, :min_height, :integer, default: nil, null: true
  end
end
