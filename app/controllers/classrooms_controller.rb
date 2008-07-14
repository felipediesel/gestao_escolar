class ClassroomsController < ApplicationController
  before_filter :load_course
  before_filter :load_students, :only => [:new, :create, :edit, :update]
  
  # GET /classrooms
  # GET /classrooms.xml
  def index
    @classrooms = @course.classrooms.find(:all, :order => 'start')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @classrooms }
    end
  end

  # GET /classrooms/1
  # GET /classrooms/1.xml
  def show
    @classroom = @course.classrooms.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @classroom }
    end
  end

  # GET /classrooms/new
  # GET /classrooms/new.xml
  def new
    @classroom = @course.classrooms.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @classroom }
    end
  end

  # GET /classrooms/1/edit
  def edit
    @classroom = @course.classrooms.find(params[:id])
  end

  # POST /classrooms
  # POST /classrooms.xml
  def create
    @classroom = @course.classrooms.new(params[:classroom])

    respond_to do |format|
      if @classroom.save
        flash[:notice] = 'Turma criada.'
        format.html { redirect_to([@course, @classroom]) }
        format.xml  { render :xml => @classroom, :status => :created, :location => @classroom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @classroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /classrooms/1
  # PUT /classrooms/1.xml
  def update
    @classroom = @course.classrooms.find(params[:id])

    respond_to do |format|
      if @classroom.update_attributes(params[:classroom])
        flash[:notice] = 'Turma atualizada.'
        format.html { redirect_to([@course, @classroom]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @classroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.xml
  def destroy
    @classroom = @course.classrooms.find(params[:id])
    @classroom.destroy

    respond_to do |format|
      format.html { redirect_to(course_classrooms_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def load_course
    @course = Course.find(params[:course_id], :include => :classrooms)
  end
  def load_students
    @students = Student.find(:all, :order => "firstname, lastname")
  end
end
