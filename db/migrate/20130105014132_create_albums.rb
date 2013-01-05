class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :style, required: true
    end
  end
end
