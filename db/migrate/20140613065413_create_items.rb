class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer   :size_id,    default: nil
      t.integer   :color_id,   default: nil
      t.integer   :status_id,  default: nil
      t.decimal   :price_sold, precision: 9, scale: 2, default: nil
      t.datetime  :date_sold,  default: nil

      t.timestamps
    end
  end
end
