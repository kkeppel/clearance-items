class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.decimal :wholesale_price, precision: 9, scale: 2
      t.decimal :retail_price, precision: 9, scale: 2
      t.integer :type_id
      t.string  :name
      
      t.timestamps
    end
  end
end
