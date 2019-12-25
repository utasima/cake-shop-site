class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :postage
      t.integer :total_price
      t.integer :order_status, default: 0, null: false, limit:4
      t.integer :payment
      t.string :name
      t.string :order_postal_code
      t.string :address
      t.integer :customer_id

      t.timestamps
    end
    add_index :orders, :order_status
  end
end
