class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :customer_id
      t.integer :orderes_id
      t.integer :number
      t.integer :price
      t.integer :making_status

      t.timestamps
    end
  end
end
