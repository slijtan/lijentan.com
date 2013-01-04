class CreateSprites < ActiveRecord::Migration
  def change
    create_table :sprites do |t|
      t.string :url, required: true
      t.string :style, required: true, default: 'image'
    end
  end
end
