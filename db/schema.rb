ActiveRecord::Schema.define(version: 20160222032328) do
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "user_id"
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
    t.string    "shoes"
    t.string   "follower_count"
    t.string   "friend_count"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
