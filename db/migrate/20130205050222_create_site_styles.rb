class CreateSiteStyles < ActiveRecord::Migration
  def change
    create_table :site_styles do |t|
      t.integer :site_id, required: true
      t.text :font_color_data, required: false, default: nil
      t.text :title_font_data, required: false, default: nil
      t.text :header_font_data, required: false, default: nil
      t.text :body_font_data, required: false, default: nil
    end
  end
end
