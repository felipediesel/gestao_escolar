class User < ActiveRecord::Base
  validates_presence_of :password, :if => :password_required?
  validates_presence_of :password_confirmation, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  validates_length_of :password, :within => 6..40, :if => :password_required?
#  before_save :encrypt_password
  
  def password=(p)
    self[:password] = p unless p.blank?
  end 
  
#  def encrypt_password       
#    self[:password] = Digest::SHA1.hexdigest(self[:password]) unless self[:password].blank?
#  end
  
  def password_required?
    new_record? || password.blank?
  end
end
