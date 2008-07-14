class CreateClassroomsStudents < ActiveRecord::Migration
  def self.up
    create_table :classrooms_students, :id => false do |t| 
      t.references :classroom, :null => false 
      t.references :student, :null => false 
    end 
    add_index(:classrooms_students, [:classroom_id, :student_id], :unique => true)
  end

  def self.down
    drop_table :classrooms_students
  end
end
