class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :picture
      t.string :name
      t.text :description
      t.integer :quantity
      t.string :slug
      t.decimal :price, precision: 8, scale: 2
      t.decimal :price_sale, precision: 8, scale: 2

      t.timestamps
    end
  end
end
