class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price, precision: 8, scale: 2

      t.timestamps
    end

    add_index :order_details, [:order_id, :product_id]
  end
end
