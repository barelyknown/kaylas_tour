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

ActiveRecord::Schema.define(version: 20131020183914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "schools", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ipeds_id"
    t.string   "name"
    t.integer  "as_of_year"
    t.integer  "total_price_in_state_on_campus"
    t.integer  "total_price_out_of_state_on_campus"
    t.string   "street_address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "general_phone_number"
    t.string   "general_fax_number"
    t.string   "financial_aid_url"
    t.string   "admissions_url"
    t.string   "online_application_url"
    t.string   "net_price_calculator_url"
    t.string   "level_of_institution"
    t.string   "highest_level_of_offering"
    t.string   "undergraduate_offering"
    t.string   "highest_degree_offered"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.boolean  "open_to_the_general_public"
    t.string   "status"
    t.boolean  "occupational"
    t.boolean  "academic"
    t.string   "religous_affiliation"
    t.boolean  "associates_degree"
    t.boolean  "bachelors_degree"
    t.boolean  "open_admissions"
    t.string   "secondary_school_gpa_requirement"
    t.string   "secondary_school_rank_requirement"
    t.string   "secondary_school_record_requirement"
    t.string   "recommendations_requirement"
    t.string   "formal_demonstration_of_competencies_requirement"
    t.string   "admission_test_score_requirement"
    t.integer  "applicants"
    t.integer  "admissions"
    t.float    "admissions_percentage"
    t.integer  "sat_reading_25th_percentile"
    t.integer  "sat_reading_75th_percentile"
    t.integer  "sat_math_75th_percentile"
    t.integer  "sat_writing_25th_percentile"
    t.integer  "sat_writing_75th_percentile"
    t.integer  "act_composite_25th_percentile"
    t.integer  "act_composite_75th_percentile"
    t.integer  "act_english_25th_percentile"
    t.integer  "act_english_75th_percentile"
    t.integer  "act_math_25th_percentile"
    t.integer  "act_math_75th_percentile"
    t.integer  "act_writing_25th_percentile"
    t.integer  "act_writing_75th_percentile"
    t.integer  "sat_math_25th_percentile"
    t.boolean  "dual_credit"
    t.boolean  "life_experience_credit"
    t.boolean  "all_remote"
    t.boolean  "study_abroad"
    t.boolean  "evenings_and_weekends"
    t.string   "calendar_system"
    t.boolean  "tuition_payment_plan"
    t.integer  "undergraduate_application_fee"
    t.boolean  "on_campus_housing"
    t.integer  "undergraduate_out_of_state_tuition_average"
    t.integer  "undergraduate_in_state_tuition"
    t.integer  "undergraduate_books_and_supplies"
    t.integer  "undergraduate_on_campus_room_and_board"
    t.float    "undergraduate_percent_receiving_financial_aid"
    t.integer  "undergraduate_average_financial_aid"
    t.boolean  "member_of_ncaa"
    t.boolean  "member_of_naia"
    t.boolean  "has_football_team"
    t.string   "football_conference"
    t.boolean  "has_basketball_team"
    t.string   "basketball_conference"
    t.text     "mission_statement"
    t.string   "mission_statement_url"
    t.integer  "enrollment_total"
    t.integer  "undergraduate_enrollment"
    t.string   "state_code"
    t.datetime "videos_last_retrieved_at"
  end

  add_index "schools", ["ipeds_id"], name: "index_schools_on_ipeds_id", using: :btree
  add_index "schools", ["name"], name: "index_schools_on_name", using: :btree

  create_table "videos", force: true do |t|
    t.string   "videoed_type"
    t.integer  "videoed_id"
    t.boolean  "featured"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "youtube_id"
    t.string   "duration"
    t.string   "title"
    t.text     "description"
    t.string   "thumbnail_url"
    t.integer  "position"
  end

end
