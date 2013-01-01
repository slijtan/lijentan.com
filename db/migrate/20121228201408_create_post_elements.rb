class CreatePostElements < ActiveRecord::Migration
  def change
    create_table :post_elements do |t|
      t.integer :post_id
      t.references :element, polymorphic: true
      t.string :position
      t.string :animation_type, default: nil
      t.integer :animation_direction, default: nil
      t.integer :sequence
    end
  end
end
