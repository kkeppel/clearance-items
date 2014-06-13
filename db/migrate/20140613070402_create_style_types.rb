class CreateStyleTypes < ActiveRecord::Migration
  def change
    create_table :style_types do |t|
      t.string :name
    end
  end
end
