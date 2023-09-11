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

ActiveRecord::Schema[7.0].define(version: 2023_09_11_032324) do
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

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.integer "address_id"
    t.string "website"
    t.string "submission_guidelines"
    t.string "union_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auditions", force: :cascade do |t|
    t.string "name_of_company"
    t.integer "theater_id"
    t.string "union_status"
    t.string "pay_scale"
    t.string "name_of_show"
    t.string "written_by"
    t.string "director"
    t.string "musical_director"
    t.string "choreographer"
    t.string "in_the_room"
    t.string "materials_to_prepare"
    t.string "how_to_submit"
    t.datetime "rehearsal_startdate"
    t.datetime "tech_startdate"
    t.datetime "previews_startdate"
    t.datetime "show_startdate"
    t.datetime "show_enddate"
    t.integer "show_address_id"
    t.string "show_warnings"
    t.text "show_description"
    t.string "additional_notes"
    t.datetime "audition_date1"
    t.string "audition_time1"
    t.datetime "audition_date2"
    t.string "audition_time2"
    t.datetime "audition_date3"
    t.string "audition_time3"
    t.datetime "audition_date4"
    t.string "audition_time4"
    t.datetime "audition_date5"
    t.string "audition_time5"
    t.datetime "callback_date1"
    t.string "callback_time1"
    t.datetime "callback_date2"
    t.string "callback_time2"
    t.datetime "callback_date3"
    t.string "callback_time3"
    t.integer "audition_address_id"
    t.integer "callback_address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "awards", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "year"
    t.string "url"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "organization"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.string "gender"
    t.string "ethnicity"
    t.string "description"
    t.text "skills"
    t.text "warnings"
    t.text "notes"
    t.integer "audition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performances", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.integer "address_id"
    t.string "url"
    t.string "role"
    t.string "director"
    t.string "musical_director"
    t.string "theater_group"
    t.string "running_date_start"
    t.string "running_date_end"
    t.string "timeframe"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "union_status"
    t.string "ethnicity"
    t.string "pronouns"
    t.string "gender"
    t.string "height"
    t.string "eye_color"
    t.string "hair_color"
    t.string "vocal_range"
    t.string "performance_types"
    t.string "agency"
    t.string "manager"
    t.string "professional_website"
    t.string "headshot_url"
    t.string "resume_url"
    t.string "headline"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "keep_private"
    t.string "age_low"
    t.string "age_high"
    t.string "other_gender"
    t.string "other_pronouns"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.integer "address_id"
    t.string "document_name"
    t.string "organization_name"
    t.string "pdf_url"
    t.string "website_url"
    t.string "primary_type"
    t.string "secondary_type"
    t.string "tertiary_type"
    t.string "description"
    t.string "logo"
    t.boolean "free_tier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talent_categories", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talents", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "talent_category_id"
    t.string "level"
    t.string "other"
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
    t.string "contact_form"
    t.string "typical_rehearsal_time"
    t.string "typical_audition_time"
    t.integer "owner_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "institution"
    t.string "city"
    t.string "state"
    t.string "degree"
    t.text "note"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "year"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "character_id"
    t.boolean "submitted"
    t.datetime "submitted_date"
    t.boolean "invited_to_callbacks"
    t.boolean "cast_in_show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.integer "company_id"
    t.datetime "email_verified"
    t.string "phone"
    t.datetime "date_of_birth"
    t.integer "address_id"
    t.string "metadata"
    t.datetime "tos_accepted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
