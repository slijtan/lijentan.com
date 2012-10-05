class AddTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :type, :string, :null => false, :default => "text"
  end
end
