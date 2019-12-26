class RenameOrderesIdColumnToOrderItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_items, :orderes_id, :order_id
  end
end
