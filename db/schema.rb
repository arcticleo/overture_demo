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

ActiveRecord::Schema[8.1].define(version: 2026_07_12_080003) do
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
    t.string "overture_release"
    t.string "postal_city"
    t.string "postcode"
    t.string "region"
    t.jsonb "sources", default: []
    t.string "street"
    t.string "unit"
    t.datetime "updated_at", null: false
    t.index ["country"], name: "index_overture_addresses_on_country"
    t.index ["geometry"], name: "index_overture_addresses_on_geometry", using: :gist
    t.index ["locality"], name: "index_overture_addresses_on_locality"
    t.index ["postcode"], name: "index_overture_addresses_on_postcode"
  end

  create_table "overture_base_features", id: :string, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.float "elevation"
    t.string "feature_class"
    t.string "feature_type", null: false
    t.geography "geometry", limit: {srid: 4326, type: "geometry", geographic: true}
    t.integer "level"
    t.string "name"
    t.jsonb "names", default: {}
    t.string "overture_release"
    t.jsonb "source_tags", default: {}
    t.jsonb "sources", default: []
    t.string "subtype"
    t.string "surface"
    t.datetime "updated_at", null: false
    t.string "wikidata"
    t.index ["feature_class"], name: "index_overture_base_features_on_feature_class"
    t.index ["feature_type"], name: "index_overture_base_features_on_feature_type"
    t.index ["geometry"], name: "index_overture_base_features_on_geometry", using: :gist
    t.index ["subtype"], name: "index_overture_base_features_on_subtype"
  end

  create_table "overture_buildings", id: :string, force: :cascade do |t|
    t.string "building_class"
    t.datetime "created_at", null: false
    t.geography "geometry", limit: {srid: 4326, type: "geometry", geographic: true}
    t.float "height"
    t.boolean "is_underground", default: false
    t.integer "level"
    t.string "name"
    t.jsonb "names", default: {}
    t.integer "num_floors"
    t.string "overture_release"
    t.jsonb "sources", default: []
    t.string "subtype"
    t.datetime "updated_at", null: false
    t.index ["building_class"], name: "index_overture_buildings_on_building_class"
    t.index ["geometry"], name: "index_overture_buildings_on_geometry", using: :gist
    t.index ["height"], name: "index_overture_buildings_on_height"
  end

  create_table "overture_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "hierarchy_level", default: 0
    t.string "name", null: false
    t.string "primary_category"
    t.jsonb "taxonomy", default: []
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_overture_categories_on_name", unique: true
    t.index ["primary_category"], name: "index_overture_categories_on_primary_category"
  end

  create_table "overture_connectors", id: :string, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.geography "geometry", limit: {srid: 4326, type: "st_point", geographic: true}
    t.string "overture_release"
    t.jsonb "sources", default: []
    t.datetime "updated_at", null: false
    t.index ["geometry"], name: "index_overture_connectors_on_geometry", using: :gist
  end

  create_table "overture_divisions", id: :string, force: :cascade do |t|
    t.float "bbox_xmax"
    t.float "bbox_xmin"
    t.float "bbox_ymax"
    t.float "bbox_ymin"
    t.string "country"
    t.datetime "created_at", null: false
    t.string "division_class"
    t.string "division_id"
    t.geography "geometry", limit: {srid: 4326, type: "geometry", geographic: true}
    t.boolean "is_land"
    t.boolean "is_territorial"
    t.string "name"
    t.jsonb "names", default: {}
    t.string "overture_release"
    t.string "region"
    t.jsonb "sources", default: []
    t.string "subtype"
    t.datetime "updated_at", null: false
    t.index ["country"], name: "index_overture_divisions_on_country"
    t.index ["division_id"], name: "index_overture_divisions_on_division_id"
    t.index ["geometry"], name: "index_overture_divisions_on_geometry", using: :gist
    t.index ["name"], name: "index_overture_divisions_on_name"
    t.index ["subtype"], name: "index_overture_divisions_on_subtype"
  end

  create_table "overture_places", id: :string, force: :cascade do |t|
    t.jsonb "addresses", default: []
    t.jsonb "brands", default: {}
    t.jsonb "categories", default: {}
    t.decimal "confidence", precision: 3, scale: 2
    t.string "country"
    t.datetime "created_at", null: false
    t.jsonb "emails", default: []
    t.geography "geometry", limit: {srid: 4326, type: "st_point", geographic: true}
    t.string "name"
    t.jsonb "names", default: {}
    t.string "operating_status"
    t.string "overture_release"
    t.jsonb "phones", default: []
    t.string "primary_category"
    t.jsonb "socials", default: []
    t.jsonb "sources", default: []
    t.datetime "updated_at", null: false
    t.jsonb "websites", default: []
    t.index ["categories"], name: "index_overture_places_on_categories", using: :gin
    t.index ["country"], name: "index_overture_places_on_country"
    t.index ["geometry"], name: "index_overture_places_on_geometry", using: :gist
    t.index ["name"], name: "index_overture_places_on_name"
    t.index ["primary_category"], name: "index_overture_places_on_primary_category"
  end

  create_table "overture_segments", id: :string, force: :cascade do |t|
    t.jsonb "access_restrictions", default: []
    t.jsonb "connectors", default: []
    t.datetime "created_at", null: false
    t.jsonb "destinations", default: []
    t.geography "geometry", limit: {srid: 4326, type: "geometry", geographic: true}
    t.string "name"
    t.jsonb "names", default: {}
    t.string "overture_release"
    t.jsonb "prohibited_transitions", default: []
    t.jsonb "road_flags", default: []
    t.jsonb "road_surface", default: []
    t.jsonb "routes", default: []
    t.string "segment_class"
    t.jsonb "sources", default: []
    t.jsonb "speed_limits", default: []
    t.string "subclass"
    t.string "subtype"
    t.datetime "updated_at", null: false
    t.index ["geometry"], name: "index_overture_segments_on_geometry", using: :gist
    t.index ["segment_class"], name: "index_overture_segments_on_segment_class"
    t.index ["subtype"], name: "index_overture_segments_on_subtype"
  end
end
