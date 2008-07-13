class Classroom < ActiveRecord::Base
  belongs_to :course
  
  validates_presence_of :name, :start, :end, :course
end
