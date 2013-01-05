class CreateAlbumElements < ActiveRecord::Migration
  def change
    create_table :album_elements do |t|
      t.integer :album_id, required: true
      t.references :element, polymorphic: true, required: true
      t.integer :sequence
    end
  end
end
