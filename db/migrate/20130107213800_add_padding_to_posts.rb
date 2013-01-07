class AddPaddingToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :padding, :string, required: false, default: nil
  end
end
