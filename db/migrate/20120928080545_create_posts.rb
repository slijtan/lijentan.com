class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :background_color, required: false
      t.string :background_url, required: false
      t.string :foreground_url, required: false
      t.string :background_quote, required: false
      t.string :background_quote_author, required: false
      t.boolean :shifting_background, required: false, default: nil
      t.string :space, required: true, default: "auto"
      t.boolean :published, default: false
      t.datetime :date_published, required: false, default: nil

      t.timestamps
    end
  end
end
