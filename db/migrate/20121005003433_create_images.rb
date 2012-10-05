class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url, required: true
      t.integer :post_id, required: true
      t.integer :sequence, default: 1, required: true
    end
  end
end
