class AddEffectToPost < ActiveRecord::Migration
  def change
    add_column :posts, :effect, :string, null: true, default: nil
  end
end
