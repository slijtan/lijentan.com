class AddHeaderPostIdToSites < ActiveRecord::Migration
  def change
    add_column :sites, :header_post_id, :integer, required: false, default: nil
  end
end
