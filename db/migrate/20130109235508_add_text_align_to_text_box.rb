class AddTextAlignToTextBox < ActiveRecord::Migration
  def change
    add_column :text_boxes, :text_align, :string, required: false, default: nil
  end
end
