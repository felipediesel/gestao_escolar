class Classroom < ActiveRecord::Base
  belongs_to :course
  has_and_belongs_to_many :students, :order => 'firstname, lastname'
  
  validates_presence_of :name, :start, :end, :course
end
