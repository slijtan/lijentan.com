class AddBackgroundImageToTextBoxes < ActiveRecord::Migration
  def change
    add_column :text_boxes, :background_image_url, :string, required: false, default: nil
  end
end
