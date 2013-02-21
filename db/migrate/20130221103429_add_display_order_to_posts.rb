class AddDisplayOrderToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :display_order, :integer, default: nil, null: true
  end
end
