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

ActiveRecord::Schema.define(:version => 20110830043702) do

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "merchandise_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",       :default => 1
    t.integer  "order_id"
  end

  create_table "merchandises", :force => true do |t|
    t.string   "merchandise_name"
    t.float    "price"
    t.string   "image_url"
    t.string   "merchandise_detail"
    t.integer  "production_month_from"
    t.integer  "production_month_to"
    t.string   "origin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.float    "promoted_price"
    t.string   "unit"
    t.string   "model_number"
  end

  create_table "orders", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "cell_phone"
    t.date     "deli_day"
    t.string   "deli_time"
    t.string   "status"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "confirm",         :default => false
    t.string   "hashed_address"
    t.string   "role"
    t.string   "user_email"
    t.string   "address"
    t.string   "phone"
    t.string   "cell_phone_1"
    t.string   "cell_phone_2"
  end

end
