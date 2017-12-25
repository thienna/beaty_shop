class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :customer_address
      t.string :customer_email
      t.string :customer_phone
      t.integer :status, default: 0
      t.decimal :total_price, precision: 8, scale: 2
      t.integer :admin_id

      t.timestamps
    end
  end
end
