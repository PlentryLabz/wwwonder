class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.string :message
      t.string :recipient
      t.integer :user_id
      t.string :state

      t.timestamps
    end
  end
end
