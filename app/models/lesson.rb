class Lesson < ActiveRecord::Base  
  belongs_to :classroom
  validates_presence_of :name, :date, :classroom, :duration
end
