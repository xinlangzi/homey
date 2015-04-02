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

ActiveRecord::Schema.define(version: 20150402225312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "banners", force: :cascade do |t|
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "file"
    t.integer  "rental_unit_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "rental_units", force: :cascade do |t|
    t.string   "title"
    t.string   "property_id"
    t.decimal  "price"
    t.integer  "number_of_bedrooms"
    t.integer  "number_of_bathrooms"
    t.integer  "number_of_dens"
    t.integer  "number_of_storage_rooms"
    t.float    "surface_area"
    t.boolean  "utility_charge_included"
    t.integer  "district_id"
    t.boolean  "short_term_lease"
    t.text     "business_center"
    t.date     "available_date"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.boolean  "Furniture Tableware Set",                        default: false, null: false
    t.boolean  "Furniture Air Conditioning",                     default: false, null: false
    t.boolean  "Furniture Stero",                                default: false, null: false
    t.boolean  "Furniture Refrigerator",                         default: false, null: false
    t.boolean  "Furniture Telephone",                            default: false, null: false
    t.boolean  "Furniture TV",                                   default: false, null: false
    t.boolean  "Furniture LED TV",                               default: false, null: false
    t.boolean  "Furniture Satellite TV",                         default: false, null: false
    t.boolean  "Furniture Oven",                                 default: false, null: false
    t.boolean  "Furniture Built-In Oven",                        default: false, null: false
    t.boolean  "Furniture Microwave Oven",                       default: false, null: false
    t.boolean  "Furniture Washing Machine",                      default: false, null: false
    t.boolean  "Furniture Vacuum Cleaner",                       default: false, null: false
    t.boolean  "Furniture Coffeemaker",                          default: false, null: false
    t.boolean  "Furniture Heating System",                       default: false, null: false
    t.boolean  "Furniture Shower Heater",                        default: false, null: false
    t.boolean  "Furniture Couch",                                default: false, null: false
    t.boolean  "Furniture Wardrobe",                             default: false, null: false
    t.boolean  "Furniture Built-In Wardrobe",                    default: false, null: false
    t.boolean  "Furniture Shoe Cabinet",                         default: false, null: false
    t.boolean  "Furniture Coffee Table",                         default: false, null: false
    t.boolean  "Furniture Dining Table & Chairs",                default: false, null: false
    t.boolean  "Furniture Book Cabinet",                         default: false, null: false
    t.boolean  "Furniture Beds",                                 default: false, null: false
    t.boolean  "Furniture Desk",                                 default: false, null: false
    t.boolean  "Furniture Internet",                             default: false, null: false
    t.boolean  "Feature Open Kitchen",                           default: false, null: false
    t.boolean  "Feature Newly Renovated",                        default: false, null: false
    t.boolean  "Feature Big Balcony",                            default: false, null: false
    t.boolean  "Feature Shower Separation",                      default: false, null: false
    t.boolean  "Feature Bath Tub",                               default: false, null: false
    t.boolean  "Feature Fully Furnished",                        default: false, null: false
    t.boolean  "Feature Unfurnished",                            default: false, null: false
    t.boolean  "Feature WIFI",                                   default: false, null: false
    t.boolean  "Feature Sea View",                               default: false, null: false
    t.boolean  "Feature Lake View",                              default: false, null: false
    t.boolean  "Feature Double Glazing",                         default: false, null: false
    t.boolean  "Feature Compound",                               default: false, null: false
    t.boolean  "Feature With Garden",                            default: false, null: false
    t.boolean  "Feature Duplex",                                 default: false, null: false
    t.boolean  "Feature With Terrace",                           default: false, null: false
    t.boolean  "Feature Central AC",                             default: false, null: false
    t.boolean  "Feature Bright & With Natural Light",            default: false, null: false
    t.boolean  "Facility XIS Bus Stop",                          default: false, null: false
    t.boolean  "Facility Childrens Playground",                  default: false, null: false
    t.boolean  "Facility Golf Course",                           default: false, null: false
    t.boolean  "Facility Outdoor Swimming Pool",                 default: false, null: false
    t.boolean  "Facility Indoor Swimming Pool",                  default: false, null: false
    t.boolean  "Facility Gym",                                   default: false, null: false
    t.boolean  "Facility Cafes",                                 default: false, null: false
    t.boolean  "Facility Beer Bars",                             default: false, null: false
    t.boolean  "Facility Assembly Room",                         default: false, null: false
    t.boolean  "Facility Western Restaurants",                   default: false, null: false
    t.boolean  "Facility Tennis Court",                          default: false, null: false
    t.boolean  "Facility 24-hour Management & Security Service", default: false, null: false
    t.boolean  "Facility Parking Space",                         default: false, null: false
    t.boolean  "Facility Snooker",                               default: false, null: false
    t.boolean  "Facility Salon",                                 default: false, null: false
    t.boolean  "Facility Park",                                  default: false, null: false
  end

  add_index "rental_units", ["property_id"], name: "index_rental_units_on_property_id", unique: true, using: :btree

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

  add_foreign_key "photos", "rental_units"
  add_foreign_key "rental_units", "districts", name: "rental_units_district_id_fk"
end
