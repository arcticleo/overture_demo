# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_03_09_163950) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "postgis"

  create_table "overture_addresses", id: :string, force: :cascade do |t|
    t.string "country"
    t.datetime "created_at", null: false
    t.geography "geometry", limit: {srid: 4326, type: "st_point", geographic: true}
    t.string "locality"
    t.string "postcode"
    t.string "region"
    t.string "street"
    t.datetime "updated_at", null: false
    t.index ["country"], name: "index_overture_addresses_on_country"
    t.index ["geometry"], name: "index_overture_addresses_on_geometry", using: :gist
    t.index ["locality"], name: "index_overture_addresses_on_locality"
    t.index ["postcode"], name: "index_overture_addresses_on_postcode"
  end

  create_table "overture_buildings", id: :string, force: :cascade do |t|
    t.string "class"
    t.datetime "created_at", null: false
    t.geography "geometry", limit: {srid: 4326, type: "st_point", geographic: true}
    t.float "height"
    t.boolean "is_underground", default: false
    t.integer "level"
    t.string "names", default: [], array: true
    t.datetime "updated_at", null: false
    t.index ["class"], name: "index_overture_buildings_on_class"
    t.index ["geometry"], name: "index_overture_buildings_on_geometry", using: :gist
    t.index ["height"], name: "index_overture_buildings_on_height"
    t.index ["level"], name: "index_overture_buildings_on_level"
  end

  create_table "overture_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "hierarchy_level", default: 0
    t.string "name", null: false
    t.string "primary_category"
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_overture_categories_on_name", unique: true
    t.index ["primary_category"], name: "index_overture_categories_on_primary_category"
  end

  create_table "overture_places", id: :string, force: :cascade do |t|
    t.jsonb "addresses", default: []
    t.jsonb "brands", default: {}
    t.jsonb "categories", default: {}
    t.string "confidence"
    t.string "country"
    t.datetime "created_at", null: false
    t.float "elevation"
    t.geography "geometry", limit: {srid: 4326, type: "st_point", geographic: true}
    t.string "names", default: [], array: true
    t.datetime "updated_at", null: false
    t.index ["brands"], name: "index_overture_places_on_brands", using: :gin
    t.index ["categories"], name: "index_overture_places_on_categories", using: :gin
    t.index ["country"], name: "index_overture_places_on_country"
    t.index ["geometry"], name: "index_overture_places_on_geometry", using: :gist
  end
end
