class AddAnalyticsToSites < ActiveRecord::Migration
  def change
    add_column :sites, :ga, :text,  default: nil, null: true
  end
end
