class AddIndexUniqPhoneidImageid < ActiveRecord::Migration
  def change
    add_index :likes, [:phone_id, :image_id], unique: true
  end
end
