class AddGeneralFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :phone_confirmation_code, :string
    add_column :users, :vk_link, :string
    add_column :users, :twitter_link, :string
    add_column :users, :instagram_link, :string
    add_column :users, :birth_date, :date
    add_column :users, :about, :string
  end
end