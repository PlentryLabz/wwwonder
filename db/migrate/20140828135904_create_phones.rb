class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number, null: false
      t.string :confirmation_code
      t.string :state
      t.integer :user_id

      t.timestamps
    end
    add_index :phones, :number, unique: true
    add_index :phones, :user_id
    remove_column :users, :phone_number
    remove_column :users, :phone_confirmation_code
  end
end
