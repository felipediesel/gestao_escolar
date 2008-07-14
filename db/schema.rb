# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080714024337) do

  create_table "classrooms", :force => true do |t|
    t.string   "name"
    t.date     "start"
    t.date     "end"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classrooms_students", :id => false, :force => true do |t|
    t.integer "classroom_id", :null => false
    t.integer "student_id",   :null => false
  end

  add_index "classrooms_students", ["classroom_id", "student_id"], :name => "index_classrooms_students_on_classroom_id_and_student_id", :unique => true

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "duration"
    t.text     "content"
    t.integer  "instructor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructors", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.date     "birth"
    t.string   "address"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.string   "zip",        :limit => 9
    t.text     "resume"
    t.string   "linkedin"
    t.string   "lattes"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.date     "birth"
    t.string   "address"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.string   "zip",        :limit => 9
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
