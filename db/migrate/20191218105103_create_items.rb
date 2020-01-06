class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, optional: true
      t.string :name , null: false
      t.integer :price , null: false
      t.text :description
      t.integer :sales_status, default: 0, null: false, limit:1
      t.string :image_id

      t.timestamps
    end
  end
end
