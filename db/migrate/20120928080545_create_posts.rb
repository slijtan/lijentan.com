class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :background_url, required: false
      t.boolean :published, default: false
      t.datetime :date_published, required: false, default: nil

      t.timestamps
    end
  end
end
