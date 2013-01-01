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

ActiveRecord::Schema.define(:version => 20121228201408) do

  create_table "background_images", :force => true do |t|
    t.integer "post_id",                    :null => false
    t.string  "url",                        :null => false
    t.string  "type",                       :null => false
    t.boolean "tile",    :default => false, :null => false
    t.integer "z_index", :default => 1,     :null => false
  end

  create_table "images", :force => true do |t|
    t.string  "url"
    t.integer "post_id"
    t.integer "position", :default => 1
  end

  create_table "post_elements", :force => true do |t|
    t.integer "post_id"
    t.integer "element_id"
    t.string  "element_type"
    t.string  "position"
    t.string  "animation_type"
    t.integer "animation_direction"
    t.integer "sequence"
  end

  create_table "posts", :force => true do |t|
    t.string   "space",            :default => "auto"
    t.string   "style"
    t.boolean  "published",        :default => false
    t.datetime "date_published"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "title"
    t.string   "bg_color"
    t.boolean  "show_header",      :default => true
    t.integer  "min_height"
    t.string   "effect"
    t.integer  "previous_post_id"
  end

  create_table "quotes", :force => true do |t|
    t.integer "post_id"
    t.string  "quote"
    t.string  "source"
    t.string  "type"
    t.string  "text_color"
    t.integer "text_size"
  end

  create_table "text_boxes", :force => true do |t|
    t.text    "text"
    t.string  "style",      :default => "full-margins"
    t.string  "bg_color"
    t.integer "text_size"
    t.string  "text_color"
  end

  create_table "videos", :force => true do |t|
    t.string  "video_id"
    t.integer "post_id"
    t.string  "host"
    t.integer "position", :default => 1
  end

end
