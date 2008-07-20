class Classroom < ActiveRecord::Base
  belongs_to :course
  has_and_belongs_to_many :students, :order => 'firstname, lastname'
  has_many :lessons, :order => 'date'
  
  validates_presence_of :name, :start, :end, :course
end
