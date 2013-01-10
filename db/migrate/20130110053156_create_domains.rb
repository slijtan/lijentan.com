class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.integer :site_id, required: true
      t.string :domain, required: true
    end
  end
end
