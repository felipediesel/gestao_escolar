class PresencesController < ApplicationController
  before_filter :load_course_and_classroom
  
  def index
    @presence = Presence.new

  end

  def create        
    Presence.destroy_all("lesson_id in (" + @classroom.lesson_ids.join(',') + ")")
    
    params[:presences].collect do |presence|
      presence = presence.split('_')      
      @presence = Presence.new({:lesson_id => presence[0], :student_id => presence[1] })
      @presence.save                    
    end    
     flash[:notice] = 'Presenças Marcadas.'
     redirect_to course_classroom_presences_path(@course, @classroom)
  end

  
  protected
  def load_course_and_classroom
    @course = Course.find(params[:course_id])
    @classroom = @course.classrooms.find(params[:classroom_id]);
  end
end
