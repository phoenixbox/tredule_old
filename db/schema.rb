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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130731135246) do

  create_table "carers", :force => true do |t|
    t.string  "username",         :null => false
    t.string  "email"
    t.string  "relationship"
    t.string  "phone"
    t.string  "crypted_password"
    t.string  "salt"
    t.integer "patient_id"
  end

  create_table "doctors", :force => true do |t|
    t.string   "username",         :null => false
    t.string   "email"
    t.string   "phone"
    t.string   "medical_school"
    t.string   "practice"
    t.string   "speciality"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "healthcares", :force => true do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "patients", :force => true do |t|
    t.string   "username",         :null => false
    t.string   "email"
    t.string   "phone"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
