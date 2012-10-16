class AddShowHeaderToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :show_header, :boolean, default: true
  end
end
