class Course < ActiveRecord::Base
  
  belongs_to :instructor
  
  validates_presence_of :name, :duration, :instructor
end
