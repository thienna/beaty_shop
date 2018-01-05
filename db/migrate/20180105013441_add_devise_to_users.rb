class AddDeviseToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :encrypted_password, null: false, default: ""
      change_column :users, :email, :string, null: false, default: ""

      t.datetime :remember_created_at
    end

    add_index :users, :email, unique: true
  end
end
