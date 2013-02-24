class AddDimensionsToSprite < ActiveRecord::Migration
  def change
    add_column :sprites, :width, :integer, default: nil, null: true
    add_column :sprites, :height, :integer, default: nil, null: true
  end
end
