class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :foods
  has_many :fitbits
  has_many :sleeps
  
  def healthrank
    sleeps = self.sleeps
    sleepbase = self.sleeps.last(5)
  end
  
  
end
