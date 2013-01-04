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

ActiveRecord::Schema.define(:version => 20121231050738) do

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "parent_id"
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "expertdetails", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.text     "detail"
    t.text     "price"
    t.text     "time"
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "session_id", :null => false
    t.integer  "post_id",    :null => false
    t.text     "content",    :null => false
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "messages", ["session_id"], :name => "index_messages_on_session_id"

  create_table "sessions", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.integer  "expert_id",                     :null => false
    t.integer  "thread_id",                     :null => false
    t.integer  "status",         :default => 0, :null => false
    t.integer  "messages_count", :default => 0
    t.datetime "deleted_at"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "taggings", ["category_id"], :name => "index_taggings_on_category_id"
  add_index "taggings", ["user_id"], :name => "index_taggings_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "uid",                           :null => false
    t.string   "email",                         :null => false
    t.string   "image",                         :null => false
    t.text     "bio",                           :null => false
    t.string   "sex",                           :null => false
    t.string   "birthday",                      :null => false
    t.boolean  "expert",     :default => false
    t.integer  "step"
    t.datetime "deleted_at"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "admin",      :default => false
  end

end
