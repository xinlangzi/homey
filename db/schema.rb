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

ActiveRecord::Schema.define(version: 20150515233546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banners", force: :cascade do |t|
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string "name"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "file"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "email",        null: false
    t.string   "mobile_phone"
    t.text     "comment",      null: false
    t.string   "property_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type",       null: false
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "district_id"
    t.string   "title"
    t.string   "property_id",                                                      null: false
    t.integer  "category"
    t.decimal  "price"
    t.integer  "dens"
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.integer  "storage_rooms"
    t.float    "surface_area"
    t.boolean  "utility_charge_included"
    t.boolean  "short_term_lease"
    t.text     "business_center"
    t.date     "available_date",                                                   null: false
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "boolean1",                                         default: false, null: false
    t.boolean  "boolean2",                                         default: false, null: false
    t.boolean  "boolean3",                                         default: false, null: false
    t.boolean  "boolean4",                                         default: false, null: false
    t.boolean  "boolean5",                                         default: false, null: false
    t.boolean  "boolean6",                                         default: false, null: false
    t.boolean  "boolean7",                                         default: false, null: false
    t.boolean  "boolean8",                                         default: false, null: false
    t.boolean  "boolean9",                                         default: false, null: false
    t.boolean  "boolean10",                                        default: false, null: false
    t.boolean  "boolean11",                                        default: false, null: false
    t.boolean  "boolean12",                                        default: false, null: false
    t.boolean  "boolean13",                                        default: false, null: false
    t.boolean  "boolean14",                                        default: false, null: false
    t.boolean  "boolean15",                                        default: false, null: false
    t.boolean  "boolean16",                                        default: false, null: false
    t.boolean  "boolean17",                                        default: false, null: false
    t.boolean  "boolean18",                                        default: false, null: false
    t.boolean  "boolean19",                                        default: false, null: false
    t.boolean  "boolean20",                                        default: false, null: false
    t.boolean  "boolean21",                                        default: false, null: false
    t.boolean  "boolean22",                                        default: false, null: false
    t.boolean  "boolean23",                                        default: false, null: false
    t.boolean  "boolean24",                                        default: false, null: false
    t.boolean  "boolean25",                                        default: false, null: false
    t.boolean  "boolean26",                                        default: false, null: false
    t.boolean  "boolean27",                                        default: false, null: false
    t.boolean  "boolean28",                                        default: false, null: false
    t.boolean  "boolean29",                                        default: false, null: false
    t.boolean  "boolean30",                                        default: false, null: false
    t.boolean  "boolean31",                                        default: false, null: false
    t.boolean  "boolean32",                                        default: false, null: false
    t.boolean  "boolean33",                                        default: false, null: false
    t.boolean  "boolean34",                                        default: false, null: false
    t.boolean  "boolean35",                                        default: false, null: false
    t.boolean  "boolean36",                                        default: false, null: false
    t.boolean  "boolean37",                                        default: false, null: false
    t.boolean  "boolean38",                                        default: false, null: false
    t.boolean  "boolean39",                                        default: false, null: false
    t.boolean  "boolean40",                                        default: false, null: false
    t.boolean  "boolean41",                                        default: false, null: false
    t.boolean  "boolean42",                                        default: false, null: false
    t.boolean  "boolean43",                                        default: false, null: false
    t.boolean  "boolean44",                                        default: false, null: false
    t.boolean  "boolean45",                                        default: false, null: false
    t.boolean  "boolean46",                                        default: false, null: false
    t.boolean  "boolean47",                                        default: false, null: false
    t.boolean  "boolean48",                                        default: false, null: false
    t.boolean  "boolean49",                                        default: false, null: false
    t.boolean  "boolean50",                                        default: false, null: false
    t.boolean  "boolean51",                                        default: false, null: false
    t.boolean  "boolean52",                                        default: false, null: false
    t.boolean  "boolean53",                                        default: false, null: false
    t.boolean  "boolean54",                                        default: false, null: false
    t.boolean  "boolean55",                                        default: false, null: false
    t.boolean  "boolean56",                                        default: false, null: false
    t.boolean  "boolean57",                                        default: false, null: false
    t.boolean  "boolean58",                                        default: false, null: false
    t.boolean  "boolean59",                                        default: false, null: false
    t.decimal  "km1",                     precision: 10, scale: 2
    t.decimal  "km2",                     precision: 10, scale: 2
    t.decimal  "km3",                     precision: 10, scale: 2
    t.decimal  "km4",                     precision: 10, scale: 2
    t.decimal  "km5",                     precision: 10, scale: 2
    t.decimal  "km6",                     precision: 10, scale: 2
    t.decimal  "km7",                     precision: 10, scale: 2
    t.decimal  "km8",                     precision: 10, scale: 2
    t.text     "transportation"
    t.integer  "area_id"
    t.string   "map"
  end

  add_index "properties", ["slug"], name: "index_properties_on_slug", unique: true, using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "kind",           limit: 2, null: false
    t.integer  "intention",      limit: 2
    t.integer  "category",       limit: 2
    t.integer  "bathroom_count", limit: 2
    t.integer  "bedroom_count",  limit: 2
    t.integer  "budget"
    t.date     "start_of_lease"
    t.date     "end_of_lease"
    t.string   "name",                     null: false
    t.string   "email",                    null: false
    t.string   "mobile_phone",             null: false
    t.text     "comments"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "systems", force: :cascade do |t|
    t.string   "logo"
    t.string   "slogan"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "our_service"
    t.text     "contact_us"
    t.text     "to_be_vip"
    t.text     "escape_clause"
    t.text     "faq_to_owner"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "properties", "areas"
end
