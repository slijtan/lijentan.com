class AddEffectToPostElement < ActiveRecord::Migration
  def change
    add_column :post_elements, :effects, :string, default: nil, null: true
  end
end
