class CreateSites < ActiveRecord::Migration
  def up
    create_table :sites do |t|
      t.string :name, required: true
      t.boolean :show_nav, required: true
    end

    add_column :posts, :site_id, :integer, required: true
  end

  def down
    drop_table :sites

    remove_column :posts, :site_id
  end
end
