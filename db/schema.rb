# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_08_121536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name", limit: 100
    t.string "uuid", limit: 100
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "criterions", force: :cascade do |t|
    t.string "name", limit: 100
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "criterions_risks", id: false, force: :cascade do |t|
    t.integer "criterion_id"
    t.integer "risk_id"
  end

  create_table "departments", force: :cascade do |t|
    t.integer "parent_id"
    t.string "parent_uuid", limit: 100
    t.string "name", limit: 100
    t.string "uuid", limit: 100
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "documents", force: :cascade do |t|
    t.integer "documentable_id"
    t.string "reactionable_type"
    t.boolean "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "experience_levels", force: :cascade do |t|
    t.decimal "coef", precision: 5, scale: 2
    t.string "name", limit: 50
    t.string "description", limit: 100
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "normalization_factors", force: :cascade do |t|
    t.string "code", limit: 10
    t.decimal "coef", precision: 5, scale: 2
    t.string "name", limit: 50
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_codes", force: :cascade do |t|
    t.string "uuid", limit: 100
    t.string "code", limit: 50
    t.string "name", limit: 50
    t.string "user_uuid", limit: 100
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_risks", force: :cascade do |t|
    t.integer "project_id"
    t.integer "risk_id"
    t.integer "project_stage_id"
    t.integer "risk_status_id"
    t.integer "risk_probability_level_id"
    t.integer "strategy_id"
    t.text "description"
    t.integer "delay"
    t.integer "added_by_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_stages", force: :cascade do |t|
    t.string "code", limit: 10
    t.string "name", limit: 50
    t.text "description"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_statuses", force: :cascade do |t|
    t.string "code", limit: 10
    t.string "name", limit: 50
    t.text "description"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_term_coefs", force: :cascade do |t|
    t.integer "range_from"
    t.integer "range_to"
    t.decimal "coef", precision: 5, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer "client_id"
    t.string "name", limit: 100
    t.text "description"
    t.integer "manager_id"
    t.integer "avg_team_cost"
    t.integer "term"
    t.integer "project_stage_id"
    t.integer "project_status_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reactions", force: :cascade do |t|
    t.integer "reactionable_id"
    t.string "reactionable_type"
    t.boolean "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "risk_answer_comments", force: :cascade do |t|
    t.integer "risk_answer_id"
    t.integer "user_id"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "risk_answers", force: :cascade do |t|
    t.integer "risk_question_id"
    t.integer "user_id"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "risk_groups", force: :cascade do |t|
    t.string "name", limit: 50
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "risk_probability_levels", force: :cascade do |t|
    t.integer "probability"
    t.string "name", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "risk_question_statuses", force: :cascade do |t|
    t.string "name", limit: 30
    t.string "code", limit: 10
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "risk_questions", force: :cascade do |t|
    t.integer "risk_id"
    t.string "topic", limit: 100
    t.text "text"
    t.integer "user_id"
    t.integer "risk_question_status_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "risk_statuses", force: :cascade do |t|
    t.string "code", limit: 10
    t.string "name", limit: 50
    t.text "description"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "risks", force: :cascade do |t|
    t.integer "risk_group_id"
    t.string "name", limit: 100
    t.text "description"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "risks_solutions", id: false, force: :cascade do |t|
    t.integer "risk_id"
    t.integer "solution_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.string "name", limit: 100
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "strategies", force: :cascade do |t|
    t.string "code", limit: 10
    t.string "name", limit: 50
    t.text "description"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "experience_level_id"
    t.integer "department_id"
    t.integer "parent_id"
    t.string "parent_uuid", limit: 100
    t.string "uuid", limit: 100
    t.string "first_name", limit: 50
    t.string "middle_name", limit: 50
    t.string "last_name", limit: 50
    t.string "job_position", limit: 100
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "watchers", force: :cascade do |t|
    t.integer "risk_question_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
