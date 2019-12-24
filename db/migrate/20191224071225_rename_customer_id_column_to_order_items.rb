class RenameCustomerIdColumnToOrderItems < ActiveRecord::Migration[5.2]
  def change
  	rename_column :order_items, :customer_id, :item_id
  end
end
