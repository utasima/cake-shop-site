class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :email
      t.string :phone_number
      t.string :costomers_postal_code
      t.string :costomers_address
      t.string :encrypted_password
      t.boolean :is_deleted
      t.string :profile_image_id

      t.timestamps
    end
  end
end
