class AddCssToTextBoxes < ActiveRecord::Migration
  def change
    add_column :text_boxes, :css, :string, default: nil, null: true
  end
end
