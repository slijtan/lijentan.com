class ChangeVideoIdToVideoData < ActiveRecord::Migration
  def up
    rename_column :videos, :video_id, :video_data
  end

  def down
    rename_column :videos, :video_data, :video_id
  end
end
