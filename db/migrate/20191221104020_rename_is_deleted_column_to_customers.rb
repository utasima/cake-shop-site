class RenameIsDeletedColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :customers,:is_deleted , :deleted_at
  end
end
