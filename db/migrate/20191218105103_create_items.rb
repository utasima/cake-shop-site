class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name , null: false
      t.integer :price , null: false
      t.text :description
      t.boolean :deleted_at
      t.string :image_id

      t.timestamps
    end
  end
end
