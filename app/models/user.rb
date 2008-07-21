require 'digest/sha1'

class User < ActiveRecord::Base
  validates_presence_of :password, :if => :password_required?
  validates_presence_of :password_confirmation, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  validates_length_of :password, :within => 6..40, :if => :password_required?
  
  def password=(p)
    self[:password] = Digest::SHA1.hexdigest(p)  unless p.blank?
  end   
  
  def password_required?
    new_record? || password.blank?
  end
end
