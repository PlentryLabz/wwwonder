class AddPhoneIdToLikes < ActiveRecord::Migration
  def change
    remove_column :likes, :user_id
    add_column :likes, :phone_id, :integer
  end
end
