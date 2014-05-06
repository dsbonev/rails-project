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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140506194814) do

  create_table "brokers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brokers_customers", id: false, force: true do |t|
    t.integer "broker_id",   null: false
    t.integer "customer_id", null: false
  end

  add_index "brokers_customers", ["customer_id", "broker_id"], name: "index_brokers_customers_on_customer_id_and_broker_id"

  create_table "customers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
