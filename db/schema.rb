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

ActiveRecord::Schema.define(:version => 20121023174923) do

  create_table "images", :force => true do |t|
    t.string  "url"
    t.integer "post_id"
    t.integer "position", :default => 1
  end

  create_table "posts", :force => true do |t|
    t.string   "type"
    t.string   "space",               :default => "auto"
    t.string   "style"
    t.boolean  "published",           :default => false
    t.datetime "date_published"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "title"
    t.string   "bg_color"
    t.string   "bg_img_fixed"
    t.string   "bg_img_shift_down_1"
    t.string   "bg_img_shift_down_2"
    t.text     "body"
    t.text     "quote"
    t.string   "quote_source"
    t.boolean  "show_header",         :default => true
    t.string   "text_color"
  end

  create_table "videos", :force => true do |t|
    t.string  "video_id"
    t.integer "post_id"
    t.string  "host"
    t.integer "position", :default => 1
  end

end
