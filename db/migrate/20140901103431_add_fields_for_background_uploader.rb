class AddFieldsForBackgroundUploader < ActiveRecord::Migration
  def change
    add_column :users, :pic_processing, :boolean, null: false, default: false
    add_column :images, :pic_processing, :boolean, null: false, default: false
    add_column :users, :pic_tmp, :string
    add_column :images, :pic_tmp, :string
  end
end
