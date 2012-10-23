class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video_id, required: true
      t.integer :post_id, required: true
      t.string :host, required: true
      t.integer :position, default: 1, required: true
    end
  end
end
