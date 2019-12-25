class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :customer_id
      t.integer :orderes_id
      t.integer :number
      t.integer :price
      t.integer :making_status, default: 0, null: false, limit:3

      t.timestamps
    end
    add_index :order_items, :making_status
  end
end


