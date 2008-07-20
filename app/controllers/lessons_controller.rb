class LessonsController < ApplicationController
  before_filter :load_course_and_classroom

  def index
    @lessons = @classroom.lessons.find(:all)

    @lesson = @classroom.lessons.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lessons }
    end
  end

  def new
    @lesson = @classroom.lessons.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lesson }
    end
  end

  def edit
    @lesson = @classroom.lessons.find(params[:id])
  end

  def create
    @lesson = @classroom.lessons.new(params[:lesson])
    @lesson.save
  end

  def update
    @lesson = @classroom.lessons.find(params[:id])
    @lesson.update_attributes(params[:lesson])
  end

  def destroy
    @lesson = @classroom.lessons.find(params[:id])
    @lesson.destroy
  end
  
  protected
  def load_course_and_classroom
    @course = Course.find(params[:course_id])
    @classroom = @course.classrooms.find(params[:classroom_id]);
  end
end
