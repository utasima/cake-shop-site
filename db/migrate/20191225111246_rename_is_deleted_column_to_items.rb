class RenameIsDeletedColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :is_deleted, :deleted_at
  end
end