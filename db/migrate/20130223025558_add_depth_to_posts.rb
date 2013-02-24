class AddDepthToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :depth, :integer, default: nil, null: true
  end
end
