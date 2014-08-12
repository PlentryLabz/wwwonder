class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name_ru, null: false
      t.string :name_en, null: false
      t.string :time_zone
      t.string :latitude
      t.string :longitute

      t.timestamps
    end
  end
end
