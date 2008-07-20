class Lesson < ActiveRecord::Base  
  belongs_to :classroom
  has_many :presences
  
  validates_presence_of :name, :date, :classroom, :duration
end
