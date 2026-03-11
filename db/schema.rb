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

ActiveRecord::Schema[8.1].define(version: 2026_03_11_000004) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "postgis"

  create_table "overture_addresses", id: :string, force: :cascade do |t|
    t.jsonb "address_levels", default: []
    t.string "country"
    t.datetime "created_at", null: false
    t.geography "geometry", limit: {srid: 4326, type: "st_point", geographic: true}
    t.string "locality"
    t.string "number"
    t.string "postcode"
    t.string "region"
    t.string "street"
    t.string "unit"
    t.datetime "updated_at", null: false
    t.index ["country"], name: "index_overture_addresses_on_country"
    t.index ["geometry"], name: "index_overture_addresses_on_geometry", using: :gist
    t.index ["locality"], name: "index_overture_addresses_on_locality"
    t.index ["postcode"], name: "index_overture_addresses_on_postcode"
  end

  create_table "overture_base_features", id: :string, force: :cascade do |t|
    t.jsonb "cartography", default: {}
    t.string "class"
    t.datetime "created_at", null: false
    t.integer "depth"
    t.integer "elevation"
    t.geometry "geometry", limit: {srid: 4326, type: "geometry"}
    t.float "height"
    t.boolean "is_intermittent", default: false
    t.boolean "is_salt", default: false
    t.integer "level"
    t.string "names", default: [], array: true
    t.jsonb "source_tags", default: {}
    t.string "subtype"
    t.string "surface"
    t.datetime "updated_at", null: false
    t.string "wikidata"
    t.index ["class"], name: "index_overture_base_features_on_class"
    t.index ["geometry"], name: "index_overture_base_features_on_geometry", using: :gist
    t.index ["subtype"], name: "index_overture_base_features_on_subtype"
    t.index ["wikidata"], name: "index_overture_base_features_on_wikidata"
  end

  create_table "overture_buildings", id: :string, force: :cascade do |t|
    t.string "class"
    t.datetime "created_at", null: false
    t.geometry "geometry", limit: {srid: 4326, type: "geometry"}
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

  create_table "overture_divisions", id: :string, force: :cascade do |t|
    t.integer "admin_level"
    t.jsonb "capital_division_ids", default: []
    t.jsonb "capital_of_divisions", default: []
    t.string "class"
    t.string "country"
    t.datetime "created_at", null: false
    t.string "division_id"
    t.geometry "geometry", limit: {srid: 4326, type: "geometry"}
    t.jsonb "hierarchies", default: {}
    t.boolean "is_disputed", default: false
    t.boolean "is_land", default: false
    t.boolean "is_territorial", default: false
    t.jsonb "local_type", default: {}
    t.string "names", default: [], array: true
    t.jsonb "norms", default: {}
    t.string "parent_division_id"
    t.jsonb "perspectives", default: {}
    t.integer "population"
    t.string "region"
    t.string "subtype"
    t.datetime "updated_at", null: false
    t.string "wikidata"
    t.index ["admin_level"], name: "index_overture_divisions_on_admin_level"
    t.index ["country"], name: "index_overture_divisions_on_country"
    t.index ["geometry"], name: "index_overture_divisions_on_geometry", using: :gist
    t.index ["parent_division_id"], name: "index_overture_divisions_on_parent_division_id"
    t.index ["region"], name: "index_overture_divisions_on_region"
    t.index ["subtype"], name: "index_overture_divisions_on_subtype"
    t.index ["wikidata"], name: "index_overture_divisions_on_wikidata"
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

  create_table "overture_transportations", id: :string, force: :cascade do |t|
    t.jsonb "access_restrictions", default: []
    t.string "class"
    t.jsonb "connectors", default: []
    t.datetime "created_at", null: false
    t.jsonb "destinations", default: []
    t.geometry "geometry", limit: {srid: 4326, type: "geometry"}
    t.jsonb "level_rules", default: []
    t.string "names", default: [], array: true
    t.jsonb "prohibited_transitions", default: []
    t.jsonb "rail_flags", default: []
    t.jsonb "road_flags", default: []
    t.jsonb "road_surface", default: []
    t.jsonb "routes", default: []
    t.jsonb "speed_limits", default: []
    t.string "subclass"
    t.jsonb "subclass_rules", default: []
    t.string "subtype"
    t.datetime "updated_at", null: false
    t.jsonb "width_rules", default: []
    t.index ["class"], name: "index_overture_transportations_on_class"
    t.index ["geometry"], name: "index_overture_transportations_on_geometry", using: :gist
    t.index ["subclass"], name: "index_overture_transportations_on_subclass"
    t.index ["subtype"], name: "index_overture_transportations_on_subtype"
  end
end
