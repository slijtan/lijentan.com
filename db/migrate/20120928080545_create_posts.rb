class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :type, required: true
      t.string :space, required: true, default: "auto"
      t.string :style, required: false
      t.boolean :published, required: true, default: false
      t.datetime :date_published, required: false
      t.timestamps

      t.string :bg_color, required: false
      t.string :bg_img_fixed, required: false
      t.string :bg_img_shift_down_1, required: false
      t.string :bg_img_shift_down_2, required: false
      t.string :title, required: false
      t.text :body, required: false
      t.text :quote, required: false
      t.string :quote_source, required: false
    end
  end
end
