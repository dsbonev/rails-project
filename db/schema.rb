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

ActiveRecord::Schema.define(version: 20140522190648) do

  create_table "brokers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brokers_customers", id: false, force: true do |t|
    t.integer "broker_id",   null: false
    t.integer "customer_id", null: false
  end

  add_index "brokers_customers", ["customer_id", "broker_id"], name: "index_brokers_customers_on_customer_id_and_broker_id"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "number"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  add_index "companies", ["customer_id"], name: "index_companies_on_customer_id"

  create_table "customers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supporting_documents", force: true do |t|
    t.string   "file"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "supporting_documents", ["company_id"], name: "index_supporting_documents_on_company_id"

end
