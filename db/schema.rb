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

ActiveRecord::Schema[7.0].define(version: 2023_02_17_142316) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auditions", force: :cascade do |t|
    t.string "date"
    t.string "name_of_company"
    t.string "name_of_show"
    t.string "written_by"
    t.string "director"
    t.string "in_the_room"
    t.string "location"
    t.string "union_status"
    t.string "pay_scale"
    t.text "materials_to_prepare"
    t.text "cast_breakdown"
    t.text "character"
    t.text "character_details"
    t.text "character_skills"
    t.text "character_warnings"
    t.datetime "rehearsal_startdate"
    t.datetime "show_startdate"
    t.datetime "show_enddate"
    t.string "show_location"
    t.string "show_warnings"
    t.text "how_to_submit"
    t.text "additional_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "theaters", force: :cascade do |t|
    t.string "name"
    t.integer "business_address_id"
    t.integer "performance_address_id"
    t.string "website"
    t.string "contact_name"
    t.string "contact_email"
    t.string "casting_director"
    t.string "casting_email"
    t.string "notes"
    t.string "season_type"
    t.string "union_status"
    t.string "image_url"
    t.string "mission"
    t.string "phone"
    t.boolean "venue", default: false
    t.boolean "childrens", default: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "company_id"
    t.string "email"
    t.datetime "email_verified"
    t.string "password_digest"
    t.string "phone"
    t.datetime "date_of_birth"
    t.integer "address_id"
    t.string "metadata"
    t.datetime "last_logged_in_at"
    t.datetime "tos_accepted_at"
    t.string "union_status"
    t.string "ethnicity"
    t.string "pronouns"
    t.string "gender"
    t.string "height"
    t.string "eye_color"
    t.string "hair_color"
    t.string "vocal_range"
    t.string "instruments_played"
    t.string "talents"
    t.string "performance_types"
    t.string "agency"
    t.string "manager"
    t.string "professional_website"
    t.string "headshot_url"
    t.string "resume_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
