class CreatePostElements < ActiveRecord::Migration
  def change
    create_table :post_elements do |t|
      t.integer :post_id
      t.references :element, polymorphic: true
      t.string :position, default: 'inline', required: true
      t.string :animation_type, default: nil
      t.string :animation_direction, default: nil
      t.integer :sequence
    end
  end
end
