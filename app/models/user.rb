require 'digest/sha1'

class User < ActiveRecord::Base
  before_save :crypt_password
  
  validates_presence_of :password, :if => :password_required?
  validates_presence_of :password_confirmation, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  validates_length_of :password, :within => 6..40, :if => :password_required?
  
  def crypt_password
    self[:password] = Digest::SHA1.hexdigest(password) unless password.blank?
  end   
  
  def password_required?
    new_record? || !password.blank?
  end
end
