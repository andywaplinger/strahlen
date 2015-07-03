class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|

      t.string :firstname
      t.string :lastname
      t.string :email

      t.timestamps
    end

    add_index :customers, :email, :unique => true
  end
end
