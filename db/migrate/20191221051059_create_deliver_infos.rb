class CreateDeliverInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :deliver_infos do |t|
      t.integer :customer_id
      t.string :address
      t.string :name
      t.string :postal_code

      t.timestamps
    end
  end
end
