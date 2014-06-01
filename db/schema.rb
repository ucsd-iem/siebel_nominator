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

ActiveRecord::Schema.define(:version => 20120507011041) do

  create_table "nominations", :force => true do |t|
    t.string   "nominee_firstname"
    t.string   "nominee_lastname"
    t.string   "nominee_department"
    t.string   "nominator_firstname"
    t.string   "nominator_lastname"
    t.string   "nominator_email"
    t.string   "token"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "nominator_letter_file_name"
    t.string   "nominator_letter_content_type"
    t.integer  "nominator_letter_file_size"
    t.datetime "nominator_letter_updated_at"
    t.string   "nominee_resume_file_name"
    t.string   "nominee_resume_content_type"
    t.integer  "nominee_resume_file_size"
    t.datetime "nominee_resume_updated_at"
    t.string   "nominee_portrait_file_name"
    t.string   "nominee_portrait_content_type"
    t.integer  "nominee_portrait_file_size"
    t.datetime "nominee_portrait_updated_at"
    t.string   "nominee_transcript_file_name"
    t.string   "nominee_transcript_content_type"
    t.integer  "nominee_transcript_file_size"
    t.datetime "nominee_transcript_updated_at"
    t.string   "nominee_statement_file_name"
    t.string   "nominee_statement_content_type"
    t.integer  "nominee_statement_file_size"
    t.datetime "nominee_statement_updated_at"
    t.string   "misc_document_file_name"
    t.string   "misc_document_content_type"
    t.integer  "misc_document_file_size"
    t.datetime "misc_document_updated_at"
    t.integer  "user_id"
    t.string   "slug"
  end

  add_index "nominations", ["token"], :name => "index_nominations_on_token", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
