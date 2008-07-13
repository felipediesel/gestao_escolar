class Course < ActiveRecord::Base
  
  belongs_to :instructor
  has_many :classrooms
  
  validates_presence_of :name, :duration, :instructor
end
