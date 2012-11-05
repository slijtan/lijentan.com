class AddPreviousPostIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :previous_post_id, :integer, null: true, default: nil
  end
end
