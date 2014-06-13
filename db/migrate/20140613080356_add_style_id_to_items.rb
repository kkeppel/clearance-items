class AddStyleIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :style_id, :integer
  end
end
