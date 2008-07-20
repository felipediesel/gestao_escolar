class ReportsController < ApplicationController
  
  def index
    
  end
  
  def students_course
    @courses = Course.find_by_sql("select courses.name, count(students.id) students_count FROM courses
      LEFT JOIN classrooms ON classrooms.course_id = courses.id
      LEFT JOIN classrooms_students ON classrooms_students.classroom_id = classrooms.id
      LEFT JOIN students ON classrooms_students.student_id = students.id
      group by courses.id
      order by students_count desc")
  end
  
  def students_classroom
    @classrooms = Classroom.find_by_sql("select classrooms.*, count(students.id) students_count FROM classrooms
      LEFT JOIN classrooms_students ON classrooms_students.classroom_id = classrooms.id
      LEFT JOIN students ON classrooms_students.student_id = students.id
      group by classrooms.id
      order by students_count desc")
  end
end