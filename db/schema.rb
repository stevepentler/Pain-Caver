ActiveRecord::Schema.define(version: 20160303025638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "races", force: :cascade do |t|
    t.string   "title"
    t.string   "title_id"
    t.float    "elevation_gain"
    t.float    "max_elevation"
    t.float    "distance"
    t.string   "description"
    t.string   "website"
    t.string   "course_record"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "user_races", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "date"
    t.string   "title"
    t.integer  "distance"
    t.string   "target_time"
    t.string   "location"
    t.string   "start_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_races", ["user_id"], name: "index_user_races_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "token"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "profile_picture"
    t.string   "city"
    t.string   "state"
    t.string   "sex"
    t.integer  "athlete_type",    default: 0
    t.float    "weight"
    t.string   "shoes"
    t.string   "follower_count"
    t.string   "friend_count"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "user_races", "users"
end
