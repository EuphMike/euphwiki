class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :wikis
  #enum attributes for Standard, Premium, Admin? 
  enum role: [:standard, :premium, :admin]
  # follow after_intialize method for default values?
  after_initialize :set_default_role
  
  def set_default_role
    self.role ||= :standard
  end
end