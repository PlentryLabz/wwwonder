class RemoveColumnsAssFromSmses < ActiveRecord::Migration
  def change
    remove_column :sms, :recipient
    remove_column :sms, :user_id
    add_column :sms, :phone_id, :integer
  end
end
