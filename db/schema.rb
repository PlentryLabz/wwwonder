# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140829174050) do

  create_table "cities", :force => true do |t|
    t.string   "name_ru",    :null => false
    t.string   "name_en",    :null => false
    t.string   "time_zone"
    t.string   "latitude"
    t.string   "longitute"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "pic"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "likes_count", :default => 0
  end

  add_index "images", ["user_id"], :name => "index_images_on_user_id"

  create_table "likes", :force => true do |t|
    t.integer  "image_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "phone_id"
  end

  add_index "likes", ["image_id"], :name => "index_likes_on_image_id"
  add_index "likes", ["phone_id", "image_id"], :name => "index_likes_on_phone_id_and_image_id", :unique => true

  create_table "phones", :force => true do |t|
    t.string   "number",            :null => false
    t.string   "confirmation_code"
    t.string   "state"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "phones", ["number"], :name => "index_phones_on_number", :unique => true
  add_index "phones", ["user_id"], :name => "index_phones_on_user_id"

  create_table "sms", :force => true do |t|
    t.string   "message"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "phone_id"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "pic"
    t.string   "first_name"
    t.string   "second_name"
    t.string   "vk_link"
    t.string   "twitter_link"
    t.string   "instagram_link"
    t.date     "birth_date"
    t.string   "about"
    t.integer  "city_id"
  end

  add_index "users", ["city_id"], :name => "index_users_on_city_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
