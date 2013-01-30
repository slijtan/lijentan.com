class ChangeVideoIdToText < ActiveRecord::Migration
  def up
    change_column :videos, :video_id, :text, required: true
  end

  def down
    change_column :videos, :video_id, :string, required: true
  end
end
